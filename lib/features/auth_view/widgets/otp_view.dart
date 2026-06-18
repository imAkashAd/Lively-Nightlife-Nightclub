import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_button.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/reset_password_flow_controller.dart';

class OtpView extends StatelessWidget {
  final VoidCallback? onNext;

  const OtpView({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 84.h, 24.w, 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextProperty(
              text: 'Check Your Email',
              textColor: AppColors.whiteColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8.h),
            TextProperty(
              text:
                  'We sent a verification code to \nuser@company.com. Enter the code below.',
              textColor: AppColors.blackColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 46.h),
            Center(
              child: OtpTextField(
                cursorColor: AppColors.whiteColor,
                numberOfFields: 4,
                enabledBorderColor: AppColors.blackColor,
                borderColor: AppColors.blackColor,
                focusedBorderColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
                fieldHeight: 56.h,
                fieldWidth: 56.w,
                showFieldAsBox: true,
                filled: true,
                fillColor: Colors.transparent,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                  height: 1.h,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                onCodeChanged: (String code) {
                  final flowController =
                      Get.find<ResetPasswordFlowController>();
                  flowController.otpCode = code.trim();
                },
                onSubmit: (String value) {
                  final flowController =
                      Get.find<ResetPasswordFlowController>();
                  flowController.otpCode = value.trim();
                },
              ),
            ),
            SizedBox(height: 46.h),
            Obx(() {
              final flowController = Get.find<ResetPasswordFlowController>();
              return CustomButton(
                borderColor: Colors.transparent,
                text: flowController.isLoading.value
                    ? 'Verifying...'
                    : 'Verify Code',
                icon: Icons.arrow_forward,
                iconSize: 20.w,
                onTap: flowController.isLoading.value
                    ? () {}
                    : () => flowController.nextPage(),
              );
            }),
            SizedBox(height: 16.h),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t receive the code?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: 'Resend',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(
                        fontFamily: 'Inter',
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
    );
  }
}
