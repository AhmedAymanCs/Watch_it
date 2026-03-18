import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> fetchVideos() async {
    emit(HomeLoading());
    try {
      final videos = await _homeRepo.fetchVideos();
      emit(HomeSuccess(videos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  String getImageUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }
}
