import '../../data/models/video_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final List<VideoModel> videos;
  HomeSuccess(this.videos);
}

class HomeError extends HomeStates {
  final String message;
  HomeError(this.message);
}
