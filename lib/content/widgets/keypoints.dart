import 'dart:math';

import 'package:flutter/material.dart';

class Keypoints {
  Keypoints(
    this.size,
    this.recognitions,
  );

  final List recognitions;
  final Size size;

  List<Widget> render(double imageWidth, double imageHeight) {
    if (recognitions.isEmpty) return <Widget>[];

    final double factorX = size.width;
    final double factorY = imageHeight / imageWidth * size.width;

    final results = <Widget>[];

    for (final recognition in recognitions) {
      final randomColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0);

      final list = recognition["keypoints"].values.map<Widget>((k) {
        String title = 'keypoint title';
        double left = k["x"] * factorX - 6;
        double top = k["y"] * factorY - 6;
        return Positioned(
          left: left,
          top: top,
          width: 100,
          height: 12,
          child: Text(
            title,
            style: TextStyle(color: randomColor, fontSize: 12.0),
          ),
        );
      }).toList();

      results.addAll(list);
    }

    return results;
  }
}
