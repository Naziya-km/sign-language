import 'dart:async';
import 'package:camera/camera.dart';

class CameraService {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(
        _cameras![0],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _controller!.initialize();
      _isCameraInitialized = true;
    }
  }

  bool get isCameraInitialized => _isCameraInitialized;

  CameraController? get controller => _controller;

  Future<void> disposeCamera() async {
    await _controller?.dispose();
  }

  Future<XFile> captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      throw Exception("Camera is not initialized");
    }
    return await _controller!.takePicture();
  }
}