import 'package:segment/content/services/tf.abstract.dart';
import 'package:tflite/tflite.dart';

class ClassifierService extends TensorFlowService {
  @override
  Future<void> predict(
    String path, [
    Function(List recognizes)? callback,
  ]) async {
    List<dynamic>? recognitions = await Tflite.runModelOnImage(path: path);

    print(recognitions);

    if (recognitions == null || recognitions.isEmpty) return;
    if (callback != null) callback(recognitions);
  }
}
