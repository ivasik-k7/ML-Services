import 'package:flutter/material.dart';
import 'package:segment/content/views/main.view.dart';
import 'package:segment/router/router.dart';

class RecognizerApp extends StatelessWidget {
  const RecognizerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        onGenerateRoute: NavigatorGenerator.onGenerateRoute,
        home: MainView(),
        title: 'Recognizer Testflight',
        debugShowCheckedModeBanner: false,
      );
}
