// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/scroll_end_blur.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';

class GTabItem {
  final String id;
  final String label;
  final String? iconPath;

  GTabItem({required this.id, required this.label, this.iconPath});
}

class GCustomTabbarWidget extends StatelessWidget {
  final List<GTabItem> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBackgroundColor;
  final Color? unselectedBackgroundColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final double? borderRadius;
  final MainAxisAlignment? space;
  final double? verPadding;
  final double? horPadding;
  final FlexFit? fit;
  final ScrollController? scrollController;

  const GCustomTabbarWidget({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedBackgroundColor,
    this.unselectedBackgroundColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.borderRadius,
    this.space,
    this.verPadding,
    this.horPadding,
    this.fit,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollEndBlur(
      width: 40.w,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: space ?? MainAxisAlignment.start,
          children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: verPadding ?? 8.h,
                  horizontal: horPadding ?? 16.w,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 12.r,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: isSelected
                      ? (selectedBackgroundColor ?? AppColors.primaryColor)
                      : (unselectedBackgroundColor ?? Colors.transparent),
                  borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
                  border: isSelected
                      ? Border.all(
                          color: selectedBorderColor ?? AppColors.primaryColor,
                        )
                      : Border.all(
                          color: AppColors.greyColor.withOpacity(0.5),
                        ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (tabs[index].iconPath != null)
                      Image.asset(
                        tabs[index].iconPath!,
                        width: 20.w,
                        height: 20.h,
                        color: isSelected
                            ? (selectedIconColor ?? AppColors.primaryColor)
                            : (unselectedIconColor ?? AppColors.greyColor),
                      ),
                    TextProperty(
                      text: tabs[index].label,
                      textColor: isSelected
                          ? (selectedTextColor ?? AppColors.whiteColor)
                          : (unselectedTextColor ?? AppColors.greyColor),
                      fontSize: 12.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),)
    );
  }
}
