import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/custom_checkbox_controller.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomCheckboxController>();

    return GestureDetector(
      onTap: () {
        controller.toggleCheckbox();
      },
      child: Obx(() {
        return Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: controller.isChecked.value
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.greyColor, width: 1.w),
          ),
          child: controller.isChecked.value
              ? Icon(Icons.check, color: Colors.white, size: 16.w)
              : null,
        );
      }),
    );
  }
}
