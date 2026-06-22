import 'package:get/get.dart';
import '../controller/user_discover_controller.dart';

class UserDiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDiscoverController>(() => UserDiscoverController());
  }
}
