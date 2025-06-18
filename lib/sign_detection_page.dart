import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'tflite_service.dart';
import 'subtitle_service.dart';
import 'camera_service.dart';
import 'dart:io';

class SignDetectionPage extends StatefulWidget {
  const SignDetectionPage({super.key});

  @override
  _SignDetectionPageState createState() => _SignDetectionPageState();
}

class _SignDetectionPageState extends State<SignDetectionPage> {
  final TFLiteService _tfliteService = TFLiteService();
  final SubtitleService _subtitleService = SubtitleService();
  final CameraService _cameraService = CameraService();

  CameraController? _cameraController;
  String detectedSign = "Waiting for input...";

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    await _tfliteService.loadModel();
    await _cameraService.initializeCamera();
    _cameraController = _cameraService.controller;

    setState(() {});
  }

  void processFrame(File imageFile) async {
    try {
      String result = await _tfliteService.recognizeSignLanguage(imageFile);

      setState(() {
        detectedSign = result;
      });

      _subtitleService.speak(detectedSign);
    } catch (e) {
      print("Error processing frame: $e");
      setState(() {
        detectedSign = "Error detecting sign";
      });
    }
  }

  @override
  void dispose() {
    _cameraService.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Detection")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _cameraController == null || !_cameraController!.value.isInitialized
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                height: 500,
                width: double.infinity,
                child: CameraPreview(_cameraController!),
              ),
          SizedBox(height: 20),
          Text(detectedSign, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                XFile imageFile = await _cameraService.captureImage();
                processFrame(File(imageFile.path));
              } catch (e) {
                print("Error capturing image: $e");
              }
            },
            child: Text("Detect Sign"),
          ),
        ],
      ),
    );
  }
}
