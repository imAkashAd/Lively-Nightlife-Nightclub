import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/home_view/controller/user_home_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/home_view/model/feed_post_model.dart';

class ShareBottomSheetWidget extends StatelessWidget {
  final FeedPostModel post;

  const ShareBottomSheetWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserHomeController>();

    final users = [
      'Alex',
      'Emma',
      'Ryan',
      'Sophia',
      'John',
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextProperty(
            text: 'Share Post',
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),

          SizedBox(height: 20.h),

          ListTile(
            onTap: controller.shareExternally,
            title: const Text('Share Externally'),
            leading: const Icon(Icons.share),
          ),

          ListTile(
            onTap: () {
              Get.back();

              Get.snackbar(
                'Copied',
                'Link copied successfully',
              );
            },
            title: const Text('Copy Link'),
            leading: const Icon(Icons.link),
          ),

          SizedBox(height: 10.h),

          Align(
            alignment: Alignment.centerLeft,
            child: TextProperty(
              text: 'Share Inside App',
              textColor: AppColors.blackColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          SizedBox(
            height: 200.h,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, index) {
                return ListTile(
                  onTap: () {
                    controller.shareInApp(
                      users[index],
                    );
                  },
                  leading: CircleAvatar(
                    child: Text(
                      users[index][0],
                    ),
                  ),
                  title: Text(
                    users[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}