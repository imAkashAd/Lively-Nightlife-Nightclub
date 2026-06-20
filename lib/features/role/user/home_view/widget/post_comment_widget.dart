import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';


class PostCommentWidget extends StatelessWidget {
  final String name;
  final String comment;

  const PostCommentWidget({
    super.key,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.h,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10.r,
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$name ',
                    style: TextStyle(
                      color:
                          AppColors.blackColor,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: comment,
                    style: TextStyle(
                      color:
                          AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}