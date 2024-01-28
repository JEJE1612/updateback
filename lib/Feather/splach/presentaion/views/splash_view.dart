import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/splach/presentaion/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String nameKey = "SplashView";

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}
