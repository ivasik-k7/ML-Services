import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:segment/app/constants.dart';
import 'package:segment/content/services/camera.service.dart';
import 'package:segment/content/services/detector.service.dart';
import 'package:segment/content/services/tf.abstract.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TensorFlowService service = DetectorService();
  final CameraService camera = CameraService();

  double? _imgWidth;
  double? _imgHeight;

  File? _image;
  final List<Widget> _recognizes = [];

  @override
  void initState() {
    super.initState();
    service.loadModel(
      AssetConstants.segmenterModel,
      AssetConstants.segmenterLabels,
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
          body: Stack(children: prepareRecognisation()),
        ),
      );

  @override
  void dispose() {
    service.close();
    super.dispose();
  }

  List<Widget> prepareRecognisation() {
    List<Widget> results = [];

    if (_image != null) {
      results.add(Align(
        alignment: Alignment.center,
        child: Image.file(
          File(_image!.path),
          fit: BoxFit.fill,
          width: _imgWidth,
          height: _imgHeight,
        ),
      ));
    }
    if (_recognizes.isNotEmpty) {
      for (final element in _recognizes) {
        results.add(Align(
          alignment: Alignment.center,
          child: element,
        ));
      }
    }

    return results;
  }

  void onCameraOpen() async => camera.open(
        ImageSource.gallery,
        callback: (XFile data) {
          final image = File(data.path);

          service.predict(image.path);

          FileImage(image)
              .resolve(const ImageConfiguration())
              .addListener((ImageStreamListener((ImageInfo info, bool _) {
                _imgWidth = info.image.width.toDouble();
                _imgHeight = info.image.height.toDouble();
              })));

          _image = image;

          notify();
        },
      );

  void notify() {
    if (mounted) setState(() {});
  }
}
