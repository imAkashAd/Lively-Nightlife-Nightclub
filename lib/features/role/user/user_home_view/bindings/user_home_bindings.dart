import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/home_view/controller/user_home_controller.dart';

class UserHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(() => UserHomeController());
  }
}
