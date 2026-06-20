import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/models/auth_role.dart';
import 'package:lively_nightlife_nightclub_party/routes/app_routes.dart';

class AuthController extends GetxController {
  final Rx<AuthRole> selectedRole = AuthRole.user.obs;

  final RxBool isLoading = false.obs;
  // final RxBool rememberMe = false.obs;
  final rememberMe = false.obs;

  // Login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // User Signup
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();

  // Club Signup
  final clubNameController = TextEditingController();
  final phoneController = TextEditingController();
  final selectedDay = DateTime.now().obs;
  final focusedDay = DateTime.now().obs;

  // Shared
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void changeRole(AuthRole role) {
    selectedRole.value = role;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login() async {

  isLoading.value = true;

  await Future.delayed(
    const Duration(seconds: 1),
  );

  isLoading.value = false;

  if (selectedRole.value == AuthRole.user) {

    Get.offAllNamed(
      AppRoute.userBottomNavigationBarView,
    );

  } else {

    Get.offAllNamed(
      AppRoute.clubBottomNavbarView,
    );

  }
}

  Future<void> register() async {
    Get.toNamed(
      AppRoute.otpVerificationView,
      arguments: {'role': selectedRole.value.name, 'type': 'signup'},
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }

  void selectDate(DateTime selectedDate) {
    dobController.text =
        "${selectedDate.day.toString().padLeft(2, '0')}/"
        "${selectedDate.month.toString().padLeft(2, '0')}/"
        "${selectedDate.year}";
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();

    clubNameController.dispose();
    phoneController.dispose();

    signupEmailController.dispose();
    signupPasswordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}
