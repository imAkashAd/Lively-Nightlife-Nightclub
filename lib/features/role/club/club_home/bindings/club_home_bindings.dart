import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/role/club/club_home/controller/club_home_controller.dart';

class ClubHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubHomeController>(() => ClubHomeController());
  }
}
