import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/controller/auth_controller.dart';


class DatePickerBottomSheet extends StatelessWidget {
  const DatePickerBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<AuthController>();

    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12),

          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
                  BorderRadius.circular(100),
            ),
          ),

          SizedBox(height: 20),

          TextProperty(
            text: 'Select Date of Birth',
            textColor: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: 20),

          // Expanded(
          //   child: AwesomeCalendarPicker(
          //     onDateSelected: (date) {
          //       controller.selectDate(
          //         date,
          //       );

          //       Get.back();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}