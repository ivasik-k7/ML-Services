import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:segment/app/constants.dart';
import 'package:segment/content/services/camera.service.dart';
import 'package:segment/content/services/segmenter.service.dart';
import 'package:segment/content/services/tf.abstract.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TensorFlowService service = SegmenterService();
  final CameraService camera = CameraService();
  XFile? _image;
  final List<Widget> _recognizes = [];

  @override
  void initState() {
    super.initState();
    service.loadModel(
      AssetConstants.classifierLabels,
      AssetConstants.classifierModel,
    );
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.camera),
            onPressed: onCameraOpen,
          ),
          backgroundColor: Colors.amber.shade300,
          body: Stack(
            children: [
              if (_image != null) Image.file(File(_image!.path)),
              if (_recognizes.isNotEmpty) ..._recognizes
            ],
          ),
        ),
      );

  @override
  void dispose() {
    service.close();
    super.dispose();
  }

  void onCameraOpen() async => camera.open(
        ImageSource.camera,
        (XFile data) {
          _image = data;
          service.predict(_image!.path, (List<dynamic> data) {
            for (final element in data) {
              _recognizes.add(Image.memory(element));
            }
          });
          notify();
        },
      );

  void notify() {
    if (mounted) setState(() {});
  }
}
