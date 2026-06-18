import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';

class AuthTitleAppbar extends StatelessWidget {

  final bool isLoginPage;
  final String title;
  final String subtitle;

  const AuthTitleAppbar({
    required this.isLoginPage,
    required this.title,
    required this.subtitle,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLoginPage == false)
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
        Expanded(
          child: Column(
            children: [
              TextProperty(
                text:  title,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.whiteColor,
              ),
              SizedBox(height: 8.h),
              TextProperty(
                  text: subtitle,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}