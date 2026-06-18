import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_button.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_textfield.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/image_path.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/password_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/widgets/step_indicator.dart';
import 'package:lively_nightlife_nightclub_party/routes/app_routes.dart';

class CreateNewPassView extends StatelessWidget {
  const CreateNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.find<PasswordController>(
      tag: 'createPassword',
    );
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            ImagePath.bluehighlightedBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 84.h, 24.w, 48.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          IconPath.backButton,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      const StepIndicator(currentStep: 3, totalSteps: 3),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  TextProperty(
                    text: 'Set New Password',
                    textColor: AppColors.whiteColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  TextProperty(
                    text:
                        'Your new password must be different from previously used passwords.',
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextProperty(
                      text: "New Password",
                      textColor: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextfield(
                    borderColor: AppColors.defaultBorderColor,
                    borderRadius: 12.r,
                    isPassword: true,
                    prefixIcon: IconPath.lockIcon,
                    fieldText: 'Enter your new password',
                    onChanged: passwordController.onPasswordChanged,
                  ),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextProperty(
                      text: "Confirm New Password",
                      textColor: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextfield(
                    borderColor: AppColors.defaultBorderColor,
                    borderRadius: 12.r,
                    isPassword: true,
                    prefixIcon: IconPath.lockIcon,
                    fieldText: 'Confirm your new password',
                    onChanged: passwordController.onConfirmPasswordChanged,
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(
                    isShadowNeed: false,
                    text: 'Reset Password',
                    icon: Icons.arrow_forward,
                    iconSize: 20.w,
                    onTap: () {
                      Get.toNamed(AppRoute.loginView);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Remember your password?   ",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoute.loginView);
                              },
                            text: "Sign in",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
