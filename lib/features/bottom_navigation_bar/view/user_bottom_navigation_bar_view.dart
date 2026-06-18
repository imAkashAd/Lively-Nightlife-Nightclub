import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';

class UserBottomNavigationView extends StatelessWidget {
  UserBottomNavigationView({super.key});

  final controller = Get.find<BottomNavigationBarController>();

  final List<Widget> pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Feed')),
    Center(child: Text('Watchlist')),
    Center(child: Text('Profile')),
  ];

  final List<String> icons = const [
    // IconPath.home,
    // IconPath.feed,
    // IconPath.wishlist,
    // IconPath.profile,
  ];

  final List<String> labels = const ['Home', 'Feed', 'Next Watch', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.defaultBackgroundColor,
      body: Obx(() => pages[controller.selectedIndex.value]),

      bottomNavigationBar: SafeArea(
        top: false,
        bottom: true,
        left: false,
        right: false,
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            // constraints: BoxConstraints(minHeight: 60.h,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              color: AppColors.defaultBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: AppColors.blackColor.withAlpha(155),
                  width: 1.w,
                )
              ),
            ),
            child: Row(
              children: List.generate(icons.length, (index) {
                final isSelected = controller.selectedIndex.value == index;
        
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changeTabIndex(index),
                    child: Container(
                      padding: EdgeInsets.only(top: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        // border: isSelected
                        //     ? Border.all(
                        //         color: AppColors.primaryColor,
                        //         width: 2.w,
                        //       )
                        //     : null,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                              BlendMode.srcIn,
                            ),
                            child: isSelected
                                ? Image.asset(
                                    icons[index],
                                    width: 24.w,
                                    height: 24.h,
                                  )
                                : Image.asset(
                                    icons[index],
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                          ),
                          SizedBox(height: 6.h),
                          // isSelected
                          //     ? 
                              Text(
                                  labels[index],
                                  key: ValueKey(labels[index]),
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
                                    height: 3.h,
                                  ),
                                )
                              // : const SizedBox(key: ValueKey('empty')),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
