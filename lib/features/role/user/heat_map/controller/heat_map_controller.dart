import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/model/club_post_model.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/model/heat_zone_model.dart';

class HeatMapController extends GetxController {
  final RxInt selectedTab = 0.obs;

  final Rx<HeatZoneModel?> selectedZone = Rx<HeatZoneModel?>(null);

  final searchText = ''.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void selectZone(HeatZoneModel zone) {
    selectedZone.value = zone;
  }

  void clearZone() {
    selectedZone.value = null;
  }

  final RxList<HeatZoneModel> zones = <HeatZoneModel>[
    HeatZoneModel(
      id: '1',
      clubName: 'Story Miami',
      latitude: 25.774,
      longitude: -80.190,
      capacity: 100,
      ticketsSold: 94,
      distance: 1.2,
      posts: [
        ClubPostModel(
          id: '1',
          mediaUrl: 'assets/images/feedImage.png',
          isVideo: true,
          caption: 'DJ starts at midnight 🔥',
          time: '1h',
        ),
        ClubPostModel(
          id: '2',
          mediaUrl: 'assets/images/feedImage.png',
          isVideo: false,
          caption: 'Packed dance floor tonight',
          time: '30m',
        ),
      ],
    ),

    HeatZoneModel(
      id: '2',
      clubName: 'LIV Miami',
      latitude: 25.779,
      longitude: -80.182,
      capacity: 100,
      ticketsSold: 82,
      distance: 2.5,
      posts: [
        ClubPostModel(
          id: '3',
          mediaUrl: 'assets/images/feedImage.png',
          isVideo: false,
          caption: 'Tonight is crazy 🚀',
          time: '1h',
        ),
      ],
    ),

    HeatZoneModel(
      id: '3',
      clubName: 'Club Space',
      latitude: 25.768,
      longitude: -80.200,
      capacity: 100,
      ticketsSold: 71,
      distance: 4.3,
      posts: [
        ClubPostModel(
          id: '4',
          mediaUrl: 'assets/images/feedImage.png',
          isVideo: false,
          caption: 'Weekend vibes 🎉',
          time: '5h',
        ),
      ],
    ),

    HeatZoneModel(
      id: '4',
      clubName: 'E11EVEN',
      latitude: 25.784,
      longitude: -80.175,
      capacity: 100,
      ticketsSold: 45,
      distance: 5.0,
      posts: [
        ClubPostModel(
          id: '5',
          mediaUrl: 'assets/images/feedImage.png',
          isVideo: false,
          caption: 'Open now 🍾',
          time: '30m',
        ),
      ],
    ),
  ].obs;

  List<HeatZoneModel> get filteredZones {
    return zones.where((zone) {
      return zone.clubName.toLowerCase().contains(
        searchText.value.toLowerCase(),
      );
    }).toList();
  }

  int get activeNow => zones.fold(0, (sum, item) => sum + item.ticketsSold);

  int get hotEvents => zones.where((e) => e.heatPercentage >= 70).length;

  int get clubsOpen => zones.length;

  int get heatZonesCount => zones.length;
}
