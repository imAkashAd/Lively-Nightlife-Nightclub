import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordFlowController extends GetxController {
  final PageController pageController = PageController();
  final currentStep = 0.obs;
  final TextEditingController emailController = TextEditingController();
  String otpCode = '';
  String? resetToken;
  final RxBool isLoading = false.obs;

  static const int totalSteps = 3;

  void onPageChanged(int index) {
    currentStep.value = index;
  }

  Future<void> nextPage() async {
    if (currentStep.value == 0) {
      // Send OTP
      // final email = emailController.text.trim();
      try {
        isLoading.value = true;
        // await ApiService.getOpt(body: {'email': email});
        await pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
      return;
    }}

  //   if (currentStep.value == 1) {
  //     // Verify OTP
  //     final email = emailController.text.trim();
  //     try {
  //       isLoading.value = true;
  //       final response = await ApiService.verifyOtp(
  //         body: {'email': email, 'otp': otpCode},
  //       );

  //       resetToken = _extractToken(response);
  //       if (resetToken != null && resetToken!.isNotEmpty) {
  //         final storage = GetStorage();
  //         storage.write('access_token', resetToken);
  //         storage.write('is_logged_in', true);
  //       }

  //       await pageController.nextPage(
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeOut,
  //       );
  //     } catch (e) {
  //       Get.snackbar('Error', e.toString());
  //     } finally {
  //       isLoading.value = false;
  //     }
  //     return;
  //   }

  //   if (currentStep.value == 2) {
  //     // Reset password
  //     final passwordController = Get.find<PasswordController>(
  //       tag: 'createPassword',
  //     );
  //     final newPassword = passwordController.password.value;
  //     try {
  //       isLoading.value = true;
  //       await ApiService.resetPassword(
  //         body: {
  //           'new_password': newPassword,
  //           'email': emailController.text.trim(),
  //           'otp': otpCode,
  //         },
  //       );
  //       Get.snackbar('Success', 'Password reset successful. Please login.');
  //       Get.find<AuthService>().resetSession();
  //       Get.offAllNamed(AppRoute.loginView);
  //     } catch (e) {
  //       Get.snackbar('Error', e.toString());
  //     } finally {
  //       isLoading.value = false;
  //     }
  //     return;
  //   }
  // }

  Future<void> previousPage() async {
    if (currentStep.value > 0) {
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // String? _extractToken(dynamic response) {
  //   if (response is Map<String, dynamic>) {
  //     final directToken =
  //         response['token'] ??
  //         response['access'] ??
  //         response['access_token'] ??
  //         response['reset_token'];
  //     if (directToken is String && directToken.isNotEmpty) {
  //       return directToken;
  //     }

  //     final data = response['data'];
  //     if (data is Map) {
  //       final nestedToken =
  //           data['token'] ??
  //           data['access'] ??
  //           data['access_token'] ??
  //           data['reset_token'];
  //       if (nestedToken is String && nestedToken.isNotEmpty) {
  //         return nestedToken;
  //       }
  //     }
  //   }

  //   return null;
  // }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
