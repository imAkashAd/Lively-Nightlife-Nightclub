import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/auth_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/custom_checkbox_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CustomCheckboxController>(() => CustomCheckboxController());
  }
}