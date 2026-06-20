import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/model/club_post_model.dart';


class HeatClubPostCardWidget extends StatelessWidget {
  final ClubPostModel post;

  const HeatClubPostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// MEDIA
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Image.asset(
                  post.mediaUrl,
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.cover,
                ),
              ),

              if (post.isVideo)
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 60.w,
                      height: 60.w,

                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.45),
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(14.w),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// CLUB INFO
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage: const AssetImage(
                        'assets/images/feedImage.png',
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextProperty(
                            text: 'Story Miami',
                            textColor: AppColors.blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),

                          TextProperty(
                            text: post.time,
                            textColor: AppColors.greyColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                /// CAPTION
                TextProperty(
                  text: post.caption,
                  textColor: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),

                SizedBox(height: 16.h),

                /// ENGAGEMENT
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 20.sp,
                      color: AppColors.greyColor,
                    ),

                    SizedBox(width: 6.w),

                    TextProperty(
                      text: '1.2k',
                      textColor: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),

                    SizedBox(width: 20.w),

                    Icon(
                      Icons.mode_comment_outlined,
                      size: 20.sp,
                      color: AppColors.greyColor,
                    ),

                    SizedBox(width: 6.w),

                    TextProperty(
                      text: '245',
                      textColor: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),

                    const Spacer(),

                    Icon(
                      Icons.share_outlined,
                      size: 20.sp,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
