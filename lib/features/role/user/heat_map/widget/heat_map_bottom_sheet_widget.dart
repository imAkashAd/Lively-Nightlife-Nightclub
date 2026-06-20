import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/controller/heat_map_controller.dart';
import 'heat_club_post_card_widget.dart';
import 'heat_zone_selected_widget.dart';

class HeatMapBottomSheetWidget extends GetView<HeatMapController> {
  const HeatMapBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .16,
      minChildSize: .16,
      maxChildSize: .92,

      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
          ),

          child: Obx(
            () => ListView(
              controller: scrollController,
              padding: EdgeInsets.all(20.w),

              children: [
                Center(
                  child: Container(
                    width: 55.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// DEFAULT STATE
                if (controller.selectedZone.value == null) ...[
                  _statisticsSection(),

                  SizedBox(height: 28.h),

                  TextProperty(
                    text: 'Popular Heat Zones',
                    textColor: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 16.h),

                  ...controller.filteredZones.map((zone) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectZone(zone);
                      },

                      child: Container(
                        margin: EdgeInsets.only(bottom: 14.h),

                        padding: EdgeInsets.all(14.w),

                        decoration: BoxDecoration(
                          color: AppColors.grey100Color,

                          borderRadius: BorderRadius.circular(18.r),
                        ),

                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,

                              decoration: BoxDecoration(
                                color: _zoneColor(zone.heatPercentage),
                                shape: BoxShape.circle,
                              ),

                              alignment: Alignment.center,

                              child: TextProperty(
                                text: '${zone.heatPercentage.toInt()}%',
                                textColor: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(width: 12.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextProperty(
                                    text: zone.clubName,
                                    textColor: AppColors.blackColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  SizedBox(height: 4.h),

                                  TextProperty(
                                    text: '${zone.distance} km away',
                                    textColor: AppColors.greyColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ]
                /// SELECTED CLUB STATE
                else ...[
                  HeatZoneSelectedWidget(zone: controller.selectedZone.value!),

                  SizedBox(height: 12.h),

                  TextProperty(
                    text: 'Live Activity Feed',
                    textColor: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 16.h),

                  ...controller.selectedZone.value!.posts.map(
                    (post) => HeatClubPostCardWidget(post: post),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statisticsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),

      decoration: BoxDecoration(
        color: AppColors.grey100Color,
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem('34.6k', 'Active'),

          _statItem('47', 'Hot'),

          _statItem('128', 'Open'),

          _statItem('6', 'Zones'),
        ],
      ),
    );
  }

  Widget _statItem(String value, String title) {
    return Column(
      children: [
        TextProperty(
          text: value,
          textColor: AppColors.blackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),

        SizedBox(height: 4.h),

        TextProperty(
          text: title,
          textColor: AppColors.greyColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Color _zoneColor(double heat) {
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
