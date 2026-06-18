import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this);
  }

  void playAndHold() {
    animationController.forward().whenComplete(() {
      animationController.stop();
      animationController.value = 1.0; // Hold final frame
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
