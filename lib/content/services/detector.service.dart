import 'package:segment/content/services/tf.abstract.dart';
import 'package:tflite/tflite.dart';

class DetectorService extends TensorFlowService {
  @override
  Future<void> predict(String path,
      [Function(List recognizes)? callback]) async {
    List<dynamic>? recognitions = await Tflite.detectObjectOnImage(
      path: path,
      model: "SSDMobileNet",
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.4,
      numResultsPerClass: 2,
      asynch: true,
    );

    print(recognitions);

    if (recognitions == null || recognitions.isNotEmpty) return;
    if (callback != null) callback(recognitions);
  }
}
