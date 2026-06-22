import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/text_property.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/colors.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/image_path.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/chat_view/controller/user_chat_controller.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/chat_view/model/user_chat_model.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/chat_view/model/user_message_model.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/discover_view/model/user_discover_club_model.dart';
import 'package:share_plus/share_plus.dart';
import '../model/user_event_model.dart';

class UserEventShareBottomSheet extends StatelessWidget {
  final UserEventModel event;

  const UserEventShareBottomSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final users = ['Alex', 'Emma', 'Ryan', 'Sophia', 'John'];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextProperty(
            text: 'Share Event',
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20.h),

          ListTile(
            onTap: () {
              Get.back();
              Share.share('Check out "${event.name}" at ${event.location} on ${event.date}!');
            },
            leading: const Icon(Icons.share, color: AppColors.blackColor),
            title: TextProperty(
              text: 'Share Externally',
              textColor: AppColors.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          ListTile(
            onTap: () {
              Get.back();
              Get.snackbar('Copied', 'Event link copied successfully');
            },
            leading: const Icon(Icons.link, color: AppColors.blackColor),
            title: TextProperty(
              text: 'Copy Link',
              textColor: AppColors.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
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
                    Get.back();
                    final userName = users[index];

                    // Convert UserEventModel to UserDiscoverClubModel representation
                    int evId = 1;
                    try {
                      evId = int.parse(event.id);
                    } catch (_) {}

                    final sharedItem = UserDiscoverClubModel(
                      id: evId,
                      name: event.name,
                      rating: 5.0,
                      location: event.location,
                      priceRange: '\$${event.price}',
                      categories: event.categories,
                      followersCount: '0',
                      upcomingEventsCount: 0,
                      capacity: 'N/A',
                      isOpenNow: true,
                      image: event.image,
                      type: 'event',
                    );

                    if (Get.isRegistered<UserChatController>()) {
                      final chatController = Get.find<UserChatController>();
                      final cIdx = chatController.chatsList.indexWhere((c) => c.name.toLowerCase().contains(userName.toLowerCase()));
                      UserChatModel chat;
                      if (cIdx != -1) {
                        chat = chatController.chatsList[cIdx];
                      } else {
                        chat = UserChatModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: userName,
                          avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                          lastSeen: 'Active now',
                          isOnline: true,
                          time: 'Just now',
                          unreadCount: 0,
                          messages: [],
                        );
                        chatController.chatsList.add(chat);
                      }

                      final newMessage = UserMessageModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        text: 'Shared an event: ${event.name}',
                        isMe: true,
                        time: DateTime.now(),
                        sharedClubOrEvent: sharedItem,
                      );

                      final updatedMessages = List<UserMessageModel>.from(chat.messages)..add(newMessage);
                      final updatedChat = chat.copyWith(messages: updatedMessages, time: 'Just now');

                      final targetIdx = chatController.chatsList.indexWhere((c) => c.name == chat.name);
                      if (targetIdx != -1) {
                        chatController.chatsList[targetIdx] = updatedChat;
                      }
                      chatController.filterChats();
                    }

                    Get.snackbar(
                      'Shared Inside App',
                      'Event shared with $userName successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.blueColor,
                      colorText: AppColors.whiteColor,
                    );
                  },
                  leading: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagePath.feedImage),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: TextProperty(
                    text: users[index],
                    textColor: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
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
