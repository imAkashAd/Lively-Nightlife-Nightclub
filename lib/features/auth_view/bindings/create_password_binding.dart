import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/password_controller.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController(), tag: 'createPassword');
  }
}