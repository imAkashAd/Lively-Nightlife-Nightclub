import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/discover_view/model/user_discover_club_model.dart';
import '../model/user_chat_model.dart';
import '../model/user_message_model.dart';
import '../model/user_story_model.dart';

class UserChatController extends GetxController {
  final RxInt selectedTab = 0.obs; // 0: For You, 1: Following, 2: Nearby, 3: Trending
  final messageInputController = TextEditingController();
  final activeChat = Rxn<UserChatModel>();

  final RxList<UserStoryModel> stories = <UserStoryModel>[].obs;
  final RxList<UserChatModel> chatsList = <UserChatModel>[].obs;
  final RxList<UserChatModel> filteredChats = <UserChatModel>[].obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    _loadDemoStories();
    _loadDemoChats();
    filterChats();

    ever(selectedTab, (_) => filterChats());
    super.onInit();
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void filterChats() {
    if (selectedTab.value == 0) {
      filteredChats.assignAll(chatsList);
    } else if (selectedTab.value == 1) {
      filteredChats.assignAll(chatsList.where((c) => c.isOnline).toList());
    } else if (selectedTab.value == 2) {
      filteredChats.assignAll(chatsList.take(3).toList());
    } else {
      filteredChats.assignAll(chatsList.skip(2).toList());
    }
  }

  void selectChat(UserChatModel chat) {
    activeChat.value = chat;
    // Mark as read when selected
    final idx = chatsList.indexWhere((c) => c.id == chat.id);
    if (idx != -1) {
      final updated = chatsList[idx].copyWith(unreadCount: 0);
      chatsList[idx] = updated;
      activeChat.value = updated;
      filterChats();
    }
  }

  void shareClubOrEvent(String userName, UserDiscoverClubModel item) {
    final idx = chatsList.indexWhere((c) => c.name.toLowerCase().contains(userName.toLowerCase()));
    UserChatModel chat;
    if (idx != -1) {
      chat = chatsList[idx];
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
      chatsList.add(chat);
    }

    final newMessage = UserMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: 'Shared a ${item.type == "event" ? "event" : "club"}: ${item.name}',
      isMe: true,
      time: DateTime.now(),
      sharedClubOrEvent: item,
    );

    final updatedMessages = List<UserMessageModel>.from(chat.messages)..add(newMessage);
    final updatedChat = chat.copyWith(
      messages: updatedMessages,
      time: 'Just now',
    );

    final targetIdx = chatsList.indexWhere((c) => c.name == chat.name);
    if (targetIdx != -1) {
      chatsList[targetIdx] = updatedChat;
      if (activeChat.value?.id == updatedChat.id) {
        activeChat.value = updatedChat;
      }
    }
    filterChats();
  }

  Future<void> createStory(bool fromCamera, {bool isVideo = false}) async {
    try {
      XFile? file = await _picker.pickImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (file != null) {
        final myStoryIdx = stories.indexWhere((s) => s.isYourStory);
        if (myStoryIdx != -1) {
          stories[myStoryIdx] = stories[myStoryIdx].copyWith(mediaPath: file.path, isVideo: isVideo);
          stories.refresh();
          Get.snackbar(
            'Story Uploaded',
            'Your new ${isVideo ? "video" : "photo"} story is now live!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withValues(alpha: 0.8),
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture story: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> pickFileAttachment() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        final platformFile = result.files.single;
        sendAttachmentMessage(
          filePath: platformFile.path,
          fileName: platformFile.name,
          fileSize: '${(platformFile.size / (1024 * 1024)).toStringAsFixed(1)} MB',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick file: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> pickImageAttachment(bool fromCamera) async {
    try {
      final file = await _picker.pickImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (file != null) sendAttachmentMessage(imagePath: file.path);
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty || activeChat.value == null) return;
    _addMessageToActiveChat(UserMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isMe: true,
      time: DateTime.now(),
    ));
    messageInputController.clear();
  }

  void sendAttachmentMessage({String? imagePath, String? filePath, String? fileName, String? fileSize}) {
    if (activeChat.value == null) return;
    _addMessageToActiveChat(UserMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: imagePath != null ? 'Sent an image' : (fileName ?? 'Sent a file'),
      isMe: true,
      time: DateTime.now(),
      imagePath: imagePath,
      filePath: filePath,
      fileName: fileName,
      fileSize: fileSize,
    ));
  }

  void _addMessageToActiveChat(UserMessageModel msg) {
    final chat = activeChat.value;
    if (chat == null) return;
    final updatedChat = chat.copyWith(
      messages: List<UserMessageModel>.from(chat.messages)..add(msg),
      time: 'Just now',
    );
    activeChat.value = updatedChat;
    final idx = chatsList.indexWhere((c) => c.id == chat.id);
    if (idx != -1) {
      chatsList[idx] = updatedChat;
      filterChats();
    }
  }

  void _loadDemoStories() {
    stories.assignAll([
      const UserStoryModel(id: '1', name: 'Your story', avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb', isYourStory: true),
      const UserStoryModel(id: '2', name: 'luna', avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330', isYourStory: false),
      const UserStoryModel(id: '3', name: 'Dj', avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d', isYourStory: false),
      const UserStoryModel(id: '4', name: 'zara', avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9', isYourStory: false),
    ]);
  }

  void _loadDemoChats() {
    chatsList.assignAll([
      UserChatModel(
        id: '1', name: 'Sophia Carter', avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
        lastSeen: '2 hours ago', isOnline: true, time: '10.24 PM', unreadCount: 2,
        messages: [
          UserMessageModel(id: '1_1', text: 'Hey Liam, progress on draft?', isMe: false, time: DateTime.now().subtract(const Duration(minutes: 5))),
          UserMessageModel(id: '1_2', text: 'Almost done!', isMe: true, time: DateTime.now().subtract(const Duration(minutes: 4))),
          UserMessageModel(id: '1_3', text: 'That\'s good! Take a look at this chart.', isMe: false, time: DateTime.now().subtract(const Duration(minutes: 3))),
        ],
      ),
      UserChatModel(
        id: '2', name: 'Ethan Parker', avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
        lastSeen: '3 hours ago', isOnline: false, time: '10.24 PM', unreadCount: 0,
        messages: [
          UserMessageModel(id: '2_1', text: 'Can you send me the files?', isMe: false, time: DateTime.now().subtract(const Duration(hours: 1))),
        ],
      ),
      UserChatModel(
        id: '3', name: 'James Walker', avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
        lastSeen: '1 day ago', isOnline: false, time: '10.24 PM', unreadCount: 0,
        messages: [
          UserMessageModel(id: '3_1', text: 'Don\'t forget the deadline is this Friday.', isMe: false, time: DateTime.now().subtract(const Duration(hours: 2))),
        ],
      ),
      UserChatModel(
        id: '4', name: 'Mia Davis', avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
        lastSeen: 'Active now', isOnline: true, time: '10.24 PM', unreadCount: 1,
        messages: [
          UserMessageModel(id: '4_1', text: 'It was great catching up earlier!', isMe: false, time: DateTime.now().subtract(const Duration(hours: 3))),
        ],
      ),
    ]);
  }

  @override
  void onClose() {
    messageInputController.dispose();
    super.onClose();
  }
}
