import 'package:flutter/material.dart';
import 'package:segment/router/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialSplashRedirect(2100);
  }

  @override
  Widget build(BuildContext context) => const SafeArea(
          child: Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      ));

  void initialSplashRedirect(int milliseconds) =>
      Future.delayed(Duration(milliseconds: milliseconds))
          .whenComplete(() => Navigator.of(context).pushNamed(Routes.main));
}
