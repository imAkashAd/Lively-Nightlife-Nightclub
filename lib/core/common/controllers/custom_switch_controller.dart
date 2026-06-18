import 'package:get/get.dart';

class CustomSwitchController extends GetxController {
  var enableHibru = false.obs;
  var enableNotifications = false.obs;
  var enableMessageAlert = false.obs;

  void toggleEnableHibru() {
    enableHibru.value = !enableHibru.value;
  }

  void toggleEnableNotifications() {
    enableNotifications.value = !enableNotifications.value;
  }

  void toggleEnableMessageAlert() {
    enableMessageAlert.value = !enableMessageAlert.value;
  }



}