import 'dart:async';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/routes/app_routes.dart';

class OtpController extends GetxController {
  final RxString otp = ''.obs;
  final RxInt seconds = 45.obs;
  final RxBool isLoading = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void updateOtp(String value) {
    otp.value = value;
  }

  void startTimer() {
    seconds.value = 45;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value <= 0) {
        timer.cancel();
      } else {
        seconds.value--;
      }
    });
  }

  void resendOtp() {
    startTimer();

    Get.snackbar('OTP Sent', 'Verification code sent again.');
  }

  Future<void> verifyOtp() async {
    if (otp.value.length != 4) {
      Get.snackbar('Invalid OTP', 'Please enter the 4 digit code.');
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    final role = Get.arguments?['role'] ?? 'user';

    if (role == 'club') {
      Get.offAllNamed(
        AppRoute.clubBottomNavbarView,
      );
    } else {
      Get.offAllNamed(AppRoute.userBottomNavigationBarView);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
