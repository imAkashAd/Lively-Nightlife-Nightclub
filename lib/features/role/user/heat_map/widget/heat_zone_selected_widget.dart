import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_button.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/model/heat_zone_model.dart';


class HeatZoneSelectedWidget extends StatelessWidget {
  final HeatZoneModel zone;

  const HeatZoneSelectedWidget({super.key, required this.zone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),

      decoration: BoxDecoration(
        color: AppColors.grey100Color,
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW
          Row(
            children: [
              Container(
                width: 70.w,
                height: 70.w,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),

                  image: const DecorationImage(
                    image: AssetImage('assets/images/feedImage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextProperty(
                      text: zone.clubName,
                      textColor: AppColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),

                    SizedBox(height: 4.h),

                    TextProperty(
                      text: '${zone.distance} km away',
                      textColor: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),

                      decoration: BoxDecoration(
                        color: _heatColor(zone.heatPercentage).withOpacity(.12),

                        borderRadius: BorderRadius.circular(100.r),
                      ),

                      child: TextProperty(
                        text: '${zone.heatPercentage.toInt()}% Full',
                        textColor: _heatColor(zone.heatPercentage),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// STATS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statCard(value: zone.capacity.toString(), title: 'Capacity'),

              _statCard(value: zone.ticketsSold.toString(), title: 'Sold'),

              _statCard(
                value: '${zone.heatPercentage.toInt()}%',
                title: 'Heat',
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// ACTIONS
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => CustomButton(
                    borderRadius: BorderRadius.circular(100.r),
                    text: zone.isFollowing.value ? 'Following' : 'Follow',
                    onTap: () {
                      zone.isFollowing.toggle();
                    },
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: CustomButton(
                  color: AppColors.whiteColor,
                  borderColor: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                  text: 'View Club',
                  onTap: () {
                    // later
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          TextProperty(
            text: 'Recent Activity',
            textColor: AppColors.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _statCard({required String value, required String title}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),

        padding: EdgeInsets.symmetric(vertical: 12.h),

        decoration: BoxDecoration(
          color: AppColors.whiteColor,

          borderRadius: BorderRadius.circular(14.r),
        ),

        child: Column(
          children: [
            TextProperty(
              text: value,
              textColor: AppColors.blackColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 4.h),

            TextProperty(
              text: title,
              textColor: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Color _heatColor(double heat) {
    if (heat >= 90) {
      return AppColors.insaneColor;
    }

    if (heat >= 70) {
      return AppColors.hotColor;
    }

    if (heat >= 50) {
      return AppColors.activeColor;
    }

    return AppColors.mildColor;
  }
}
