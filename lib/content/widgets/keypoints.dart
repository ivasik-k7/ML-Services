import 'dart:math';

import 'package:flutter/material.dart';

class Keypoints {
  Keypoints(
    this.size,
    this.recognitions,
  );

  final List recognitions;
  final Size size;

  List<Widget> calculate(double imageWidth, double imageHeight) {
    if (recognitions.isEmpty) return <Widget>[];
    final double factorX = size.width;
    final double factorY = imageHeight / imageWidth * size.width;

    final results = <Widget>[];

    for (final recognition in recognitions) {
      Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
      var list = recognition["keypoints"].values.map<Widget>((k) {
        return Positioned(
          left: k["x"] * factorX - 6,
          top: k["y"] * factorY - 6,
          width: 100,
          height: 12,
          child: Text(
            "● ${k["part"]}",
            style: TextStyle(
              color: color,
              fontSize: 12.0,
            ),
          ),
        );
      }).toList();

      results..addAll(list);
    }

    return results;
  }
}
