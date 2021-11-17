import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

import 'package:segment/content/services/tf.abstract.dart';

class ClassifierService extends TensorFlowService {
  @override
  Future<void> predict(String path, [TFServiceCallback? callback]) async {
    try {
      final recognitions = await Tflite.runModelOnImage(
        path: path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      if (recognitions == null || recognitions.isEmpty) return;
      if (callback != null) callback(recognitions);
    } on PlatformException {
      print('Classification failed!');
    }
  }
}
