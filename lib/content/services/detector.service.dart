import 'package:flutter/services.dart';
import 'package:segment/content/services/tf.abstract.dart';
import 'package:tflite/tflite.dart';

class DetectorService extends TensorFlowService {
  @override
  Future<void> predict(String path, [TFServiceCallback? callback]) async {
    try {
      final recognitions = await Tflite.detectObjectOnImage(
        path: path,
        model: "YOLO",
        threshold: 0.3,
        imageMean: 0.0,
        imageStd: 255.0,
        numResultsPerClass: 1,
      );

      print(recognitions);

      if (recognitions == null) return;
      if (callback != null) callback(recognitions);
    } on PlatformException {
      print('Detection failed!');
    }
  }
}
