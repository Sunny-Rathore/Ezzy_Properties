// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/controller/splash_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/utils/img_utils.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.put(AuthController());
    final splashController = Get.put(SplashController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            curve: Curves.fastOutSlowIn,
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            builder: ((BuildContext context, value, child) {
              return Transform.rotate(
                angle: value * pi * 2,
                child: Image.asset(
                  ezzy_logo,
                  height: value * 180.0,
                  width: value * 180.0,
                  fit: BoxFit.fill,
                ),
              );
            }),
          ).center()
        ],
      ),
    );
  }
}
