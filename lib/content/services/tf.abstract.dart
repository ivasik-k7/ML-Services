import 'package:segment/content/services/service.abstract.dart';
import 'package:tflite/tflite.dart';

abstract class TensorFlowService<T> implements Service {
  void predict(String path, [Function(List<T> recognizes)? callback]);

  void loadModel(String labelsPath, String modelPath) async =>
      await Tflite.loadModel(model: modelPath, labels: labelsPath);

  @override
  void close() => Tflite.close();
}
