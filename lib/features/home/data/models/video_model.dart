class VideoModel {
  final String id;
  final String title;
  final String youtubeId;

  const VideoModel({
    required this.id,
    required this.title,
    required this.youtubeId,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Not Found',
      youtubeId: json['youtubeId'] ?? 'Not Found',
    );
  }
}
