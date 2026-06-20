import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/icon_path.dart';

class HeatZoneMarkerWidget extends StatelessWidget {
  final double percentage;
  final Color color;

  const HeatZoneMarkerWidget({
    super.key,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 140.w,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(.18),
      ),

      child: Center(
        child: Container(
          width: 70.w,
          height: 70.w,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.12),

            border: Border.all(color: color, width: 1.5),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconPath.flameIcon,
                width: 16.w,
                height: 16.h,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),

              SizedBox(height: 4.h),

              TextProperty(
                text: '${percentage.toInt()}%',
                textColor: color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
