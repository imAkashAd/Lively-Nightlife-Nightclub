import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';

class HeatStatisticsWidget extends StatelessWidget {
  final String value;
  final String title;

  const HeatStatisticsWidget({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.grey100Color,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          TextProperty(
            text: value,
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),

          SizedBox(height: 4.h),

          TextProperty(
            text: title,
            textColor: AppColors.greyColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
