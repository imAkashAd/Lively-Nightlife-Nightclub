import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_textfield.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';

class HeatMapHeaderWidget extends StatelessWidget {
  const HeatMapHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// TOP BAR
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 22.sp,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(width: 10.w),

            TextProperty(
              text: 'lively',
              textColor: AppColors.blackColor,
              fontSize: 24.sp,
              fontFamily: 'Sora',
              fontWeight: FontWeight.w700,
            ),

            const Spacer(),

            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.primaryColor.withOpacity(.15),

              child: ClipOval(
                child: Image.network(
                  'https://i.pravatar.cc/150?img=12',
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        /// SEARCH + FILTER
        Row(
          children: [
            Expanded(
              child: CustomTextfield(
                fieldText: 'Search clubs, people...',
                fillColor: AppColors.whiteColor,
                borderRadius: 100.r,
              ),
            ),

            SizedBox(width: 12.w),

            GestureDetector(
              onTap: () {
                // next step
              },
              child: Container(
                width: 52.w,
                height: 52.h,

                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 12,
                    ),
                  ],
                ),

                child: Center(
                  child: SvgPicture.asset(
                    IconPath.filterIcon,
                    width: 22.w,
                    height: 22.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
