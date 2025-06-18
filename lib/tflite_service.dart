import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class TFLiteService {
  Interpreter? _interpreter;
  List<String> _labels = [];
  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      // Load the TFLite model
      _interpreter = await Interpreter.fromAsset('assets/first_models.tflite');
      await loadLabels();
      _modelLoaded = true;
      print("Model & Labels Loaded Successfully!");
    } catch (e) {
      print("Error Loading Model: $e");
    }
  }

  Future<void> loadLabels() async {
    try {
      final labelData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelData.split('\n').map((e) => e.trim()).toList();
      print('Loaded ${_labels.length} labels');
    } catch (e) {
      print("Error Loading Labels: $e");
    }
  }

  Future<String> recognizeSignLanguage(File imageFile) async {
    if (!_modelLoaded) {
      await loadModel();
    }

    if (_interpreter == null) {
      return 'Model not loaded';
    }

    // Read the image file
    img.Image? image = img.decodeImage(await imageFile.readAsBytes());
    if (image == null) return 'Failed to decode image';

    // Convert to grayscale
    img.Image grayscale = img.grayscale(image);

    // Resize to 64x64
    img.Image resized = img.copyResize(grayscale, width: 64, height: 64);

    // Save the resized image
    Directory tempDir = await getTemporaryDirectory();
    String resizedImagePath = path.join(tempDir.path, 'resized_image.png');
    File resizedFile = File(resizedImagePath);
    resizedFile.writeAsBytesSync(img.encodePng(resized));
    print('Resized image saved to $resizedImagePath');

    // Convert image to input tensor format [1, 64, 64, 1]
    var input = List.generate(
      1,
      (_) => List.generate(
        64,
        (y) => List.generate(
          64,
          (x) => List.generate(
            1,
            (_) => img.getLuminance(resized.getPixel(x, y)) / 255.0,
          ),
        ),
      ),
    );

    // Adjust the output tensor shape to match the model's expected output shape
    var output = List.filled(1 * 5, 0.0).reshape([1, 5]);

    // Run model
    _interpreter!.run(input, output);

    // Find class with highest probability
    int maxIndex = 0;
    double maxProb = output[0][0];
    for (int i = 1; i < output[0].length; i++) {
      if (output[0][i] > maxProb) {
        maxProb = output[0][i];
        maxIndex = i;
      }
    }

    // Debug logging
    print('Raw output: ${output[0]}');
    print('Predicted class index: $maxIndex with confidence: $maxProb');

    // Return predicted label
    if (maxIndex >= 0 && maxIndex < _labels.length) {
      return _labels[maxIndex];
    } else {
      return 'Unknown (index $maxIndex)';
    }
  }

  void dispose() {
    _interpreter?.close();
  }
}
