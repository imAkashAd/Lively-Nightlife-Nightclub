import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_button.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/image_path.dart';

import '../controller/otp_controller.dart';

class OtpVerificationView extends GetView<OtpController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagePath.bluehighlightedBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: Get.back,
                    child: SvgPicture.asset(
                      IconPath.backArrowIcon,
                      height: 24.h,
                    ),
                  ),

                  SizedBox(height: 60.h),

                  TextProperty(
                    text: 'OTP Code \nVerification',
                    textColor: AppColors.blackColor,
                    fontSize: 32.sp,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 12.h),

                  TextProperty(
                    text:
                        'Code has been sent to your email address \n*******789@gmail.com.',
                    textColor: AppColors.greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(height: 50.h),

                  Center(
                    child: OtpTextField(
                      cursorColor: AppColors.primaryColor,
                      showCursor: false,
                      numberOfFields: 4,
                      fieldWidth: 60.w,
                      fieldHeight: 60.h,
                      borderRadius: BorderRadius.circular(12.r),
                      enabledBorderColor: AppColors.defaultBorderColor,
                      focusedBorderColor: AppColors.primaryColor,
                      borderColor: AppColors.defaultBorderColor,
                      fillColor: Colors.transparent,
                      filled: true,
                      showFieldAsBox: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: 'Poppins',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      onSubmit: controller.updateOtp,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  Center(
                    child: Obx(
                      () => controller.seconds.value > 0
                          ? TextProperty(
                              text:
                                  'Resend code in ${controller.seconds.value}s',
                              textColor: AppColors.greyColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            )
                          : GestureDetector(
                              onTap: controller.resendOtp,
                              child: TextProperty(
                                text: 'Resend Code',
                                textColor: AppColors.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),

                  const Spacer(),

                  Obx(
                    () => CustomButton(
                      text: controller.isLoading.value
                          ? 'Verifying...'
                          : 'Verify & Continue',
                      onTap: controller.verifyOtp,
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
