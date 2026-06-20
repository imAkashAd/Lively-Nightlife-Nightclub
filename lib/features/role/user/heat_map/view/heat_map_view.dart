import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/controller/heat_map_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/widget/heat_filer_tabs_widget.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/widget/heat_map_bottom_sheet_widget.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/widget/heat_map_header_widget.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/widget/heat_map_legend_widget.dart';

class HeatMapView extends GetView<HeatMapController> {
  const HeatMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(25.774, -80.190),
              zoom: 13,
            ),

            myLocationEnabled: true,
            myLocationButtonEnabled: false,

            zoomControlsEnabled: false,
            compassEnabled: false,

            mapToolbarEnabled: false,

            circles: _buildHeatCircles(),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),

                  const HeatMapHeaderWidget(),

                  SizedBox(height: 16.h),

                  const HeatFilterTabsWidget(),

                  const Spacer(),
                ],
              ),
            ),
          ),

          Positioned(
            top: 220.h,
            right: 20.w,
            child: const HeatMapLegendWidget(),
          ),

          const HeatMapBottomSheetWidget(),
        ],
      ),
    );
  }

  Set<Circle> _buildHeatCircles() {
    return controller.zones.map((zone) {
      Color color;

      if (zone.heatPercentage >= 90) {
        color = AppColors.insaneColor;
      } else if (zone.heatPercentage >= 70) {
        color = AppColors.hotColor;
      } else if (zone.heatPercentage >= 50) {
        color = AppColors.activeColor;
      } else {
        color = AppColors.mildColor;
      }

      return Circle(
        circleId: CircleId(zone.id),

        center: LatLng(zone.latitude, zone.longitude),

        radius: zone.heatPercentage * 8,

        fillColor: color.withOpacity(.18),

        strokeColor: color,

        strokeWidth: 1,

        consumeTapEvents: true,

        onTap: () {
          controller.selectZone(zone);
        },
      );
    }).toSet();
  }
}
