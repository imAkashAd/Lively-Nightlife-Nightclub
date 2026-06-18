import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/image_path.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/reset_password_flow_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/widgets/step_indicator.dart';

class PasswordResetFlowView extends StatelessWidget {
  PasswordResetFlowView({super.key});

  final controller = Get.find<ResetPasswordFlowController>();

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 84.h, 24.w, 48.h),
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.currentStep.value == 0) {
                            Get.back();
                          } else {
                            controller.previousPage();
                          }
                        },
                        child: Image.asset(
                          IconPath.backButton,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      StepIndicator(
                        currentStep: controller.currentStep.value + 1,
                        totalSteps: ResetPasswordFlowController.totalSteps,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // ForgetPassView(onNext: controller.nextPage),
                      // OtpView(onNext: controller.nextPage),
                      // CreateNewPassStepPage(
                      //   onFinish: controller.nextPage,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
