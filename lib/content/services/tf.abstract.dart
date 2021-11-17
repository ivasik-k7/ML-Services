import 'package:flutter/services.dart';
import 'package:segment/content/services/service.abstract.dart';
import 'package:tflite/tflite.dart';

typedef TFServiceCallback<T> = Function(List<T> elements);

abstract class TensorFlowService<T> implements Service {
  void predict(String path, [TFServiceCallback callback]);

  void loadModel(
    String modelPath, [
    String? labelsPath,
  ]) async {
    Tflite.close();
    try {
      String? result =
          await Tflite.loadModel(model: modelPath, labels: labelsPath ?? '');
      // ignore: avoid_print
      print(result);
    } on PlatformException {
      // ignore: avoid_print
      print("Model wasn`t loaded!");
    }
  }

  @override
  void close() => Tflite.close();
}
