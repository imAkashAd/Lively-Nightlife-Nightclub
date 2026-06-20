class ClubPostModel {
  final String id;
  final String mediaUrl;
  final bool isVideo;
  final String caption;
  final String time;

  ClubPostModel({
    required this.id,
    required this.mediaUrl,
    required this.isVideo,
    required this.caption,
    required this.time,
  });
}