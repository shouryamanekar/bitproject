import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class MLModelIntegration {
  static const String modelPath = 'assets/model.tflite'; // Path to your ML model file
  static const int INPUT_SIZE = 13; // Number of input values for your model
  static const int OUTPUT_SIZE = 1; // Number of output values for your model

  static late Interpreter _interpreter;

  static Future<void> loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions()
        ..useNnApiForAndroid = true; // Enable NNAPI for Android (optional)

      _interpreter = await Interpreter.fromAsset(modelPath,
          options: interpreterOptions);

      print('ML model loaded successfully');
    } catch (e) {
      print('Failed to load ML model: $e');
    }
  }

  static Future<List<double>> runInference(List<double> inputs) async {
    try {
      List<List<double>> inputList = [inputs];
      TensorBuffer outputBuffer =
      TensorBufferFloat(<int>[1, OUTPUT_SIZE]);
      TensorBuffer inputBuffer =
      TensorBufferFloat(<int>[1, INPUT_SIZE]);
      Float32List inputBufferValues = Float32List.view(inputBuffer.buffer);
      for (int i = 0; i < INPUT_SIZE; i++) {
        inputBufferValues[i] = inputs[i];
      }
      final modelInputs = [inputBuffer];
      final modelOutputs = [outputBuffer];

      _interpreter.run(modelInputs, modelOutputs);

      List<double> outputValues = outputBuffer.getDoubleList();

      print('ML model inference completed');
      return outputValues;
    } catch (e) {
      print('Failed to run ML model inference: $e');
      return [];
    }
  }
}
