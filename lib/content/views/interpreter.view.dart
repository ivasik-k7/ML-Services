import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:segment/content/services/camera.service.dart';

class InterpreterView extends StatefulWidget {
  const InterpreterView({Key? key}) : super(key: key);

  @override
  _InterpreterViewState createState() => _InterpreterViewState();
}

class _InterpreterViewState extends State<InterpreterView> {
  final CameraService camera = CameraService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_front),
          onPressed: openCamera,
        ),
        body: const Center(child: Text('Interpreter')),
      ));

  void runInterpreter() {}

  void openCamera() {
    camera.open(ImageSource.camera, callback: (XFile file) async {
      final inputBytes = await file.readAsBytes();
    });
  }
}
