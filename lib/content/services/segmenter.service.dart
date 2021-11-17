import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:segment/content/services/tf.abstract.dart';
import 'package:tflite/tflite.dart';

class SegmenterService extends TensorFlowService {
  @override
  Future<void> predict(String path,
      [Function(List recognizes)? callback]) async {
    Uint8List? recognitions = await Tflite.runSegmentationOnImage(
        path: path,
        imageMean: 0.0,
        imageStd: 255.0,
        outputType: "png",
        asynch: false,
        labelColors: <int>[
          const Color.fromARGB(255, 192, 0, 128).value // horse
        ]);

    if (recognitions == null || recognitions.isEmpty) return;

    if (callback != null) {
      callback.call(List.from([Uint8List.fromList(recognitions)]));
    }
  }
}
