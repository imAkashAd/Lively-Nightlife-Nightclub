import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';

class CustomDropdownField extends StatelessWidget {
  final double? fontSize;
  final String hintText;
  final BorderSide? borderSide;
  final List<String> items;
  final RxString selectedValue;
  final RxString? selectedValue1;
  final double? height;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? fillColor;
  final EdgeInsets contentPadding;

  const CustomDropdownField({
    super.key,
    this.fontSize,
    this.hintTextColor,
    required this.hintText,
    this.borderSide,
    required this.items,
    required this.selectedValue,
    this.selectedValue1,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.fillColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 13,
      vertical: 14,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10.6,
        //     offset: const Offset(0, 0),
        //   ),
        // ],
      ),
      height: height,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Obx(
          () => DropdownButtonFormField<String>(
            isExpanded: true,
            iconSize: 0,
            icon: SizedBox(
              width: 12.w,
              height: 8.h,
              child: SvgPicture.asset(
                IconPath.dropdown,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            hint: Text(
              hintText,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: hintTextColor ?? AppColors.primaryTextColor,
                fontSize: fontSize ?? 16.sp,
              ),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: hintTextColor ?? AppColors.primaryTextColor,
                fontSize: fontSize ?? 16.sp,
              ),
              filled: true,
              fillColor: fillColor,
              contentPadding: contentPadding,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor!, width: borderWidth ?? 1),
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: borderSide ?? BorderSide(color: borderColor!, width: borderWidth ?? 1),
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
            ),
            // ignore: deprecated_member_use
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            items: items
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value, style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                selectedValue.value = value;
              }
            },
          ),
        ),
      ),
    );
  }
}
