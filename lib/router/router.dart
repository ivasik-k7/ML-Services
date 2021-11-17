import 'package:flutter/material.dart';
import 'package:segment/content/views/interpreter.view.dart';
import 'package:segment/content/views/main.view.dart';
import 'package:segment/content/views/splash.view.dart';
import 'package:segment/router/routes.dart';

class NavigatorGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.interpreter:
        return MaterialPageRoute(builder: (_) => const InterpreterView());
      default:
        throw 'Unexpected route';
    }
  }
}
