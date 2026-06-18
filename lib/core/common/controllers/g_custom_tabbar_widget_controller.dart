import 'package:get/get.dart';

class GCustomTabbarWidgetController extends GetxController {
  var selectedTabIndex = 0.obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;



    
  }
}
