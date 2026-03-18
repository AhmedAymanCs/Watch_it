class ProfileModel {
  final String id;
  final String youtubeUrl;
  final String? aboutDeveloper;

  const ProfileModel({
    required this.id,
    required this.youtubeUrl,
    this.aboutDeveloper,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      youtubeUrl: json['youtube_url'] ?? '',
      aboutDeveloper: json['about_developer'] ?? '',
    );
  }
}
