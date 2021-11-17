import 'dart:math';

import 'package:flutter/material.dart';

class VisionBoxes {
  const VisionBoxes(this.size, this.recognitons);
  final List recognitons;
  final Size size;

  List<Widget> render(double width, double height) {
    if (recognitons.isEmpty) return [];

    final double factorX = size.width;
    final double factorY = height / width * size.width;

    final results = <Widget>[];

    for (final element in recognitons) {
      final randomColor =
          Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0);

      final list = element["keypoints"].values.map<Widget>((k) {
        String title = 'hardcoded title';
        return Positioned(
          left: k["x"] * factorX - 6,
          top: k["y"] * factorY - 6,
          width: 100,
          height: 12,
          child: Text(
            title,
            style: TextStyle(
              color: randomColor,
              fontSize: 12.0,
            ),
          ),
        );
      }).toList();

      results.add(list);
    }

    return results;
  }
}
