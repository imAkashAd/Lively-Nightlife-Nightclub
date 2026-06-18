import 'package:flutter/material.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: value,
        onChanged: onChanged,

        activeThumbColor: AppColors.whiteColor,
        activeTrackColor: AppColors.greyColor,
        inactiveThumbColor: AppColors.primaryColor,
        inactiveTrackColor: Color(0xFFDFE3E8),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),

        // Additional styling
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}