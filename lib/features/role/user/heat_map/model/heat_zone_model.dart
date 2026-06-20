import 'package:get/get.dart';

import 'club_post_model.dart';

class HeatZoneModel {
  final String id;
  final String clubName;

  final double latitude;
  final double longitude;

  final int capacity;
  final int ticketsSold;

  final double distance;

  final RxBool isFollowing;

  final List<ClubPostModel> posts;

  HeatZoneModel({
    required this.id,
    required this.clubName,
    required this.latitude,
    required this.longitude,
    required this.capacity,
    required this.ticketsSold,
    required this.distance,
    required this.posts,
    bool isFollowing = false,
  }) : isFollowing = isFollowing.obs;

  double get heatPercentage => (ticketsSold / capacity) * 100;

  String get heatLevel {
    if (heatPercentage >= 80) {
      return 'Insane';
    }

    if (heatPercentage >= 60) {
      return 'Hot';
    }

    if (heatPercentage >= 40) {
      return 'Active';
    }

    return 'Mild';
  }
}
