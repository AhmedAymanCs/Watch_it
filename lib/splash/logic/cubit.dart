import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/splash/logic/states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  void startSplash() async {
    emit(SplashLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashSuccessState());
    } catch (error) {
      emit(SplashErrorState(error.toString()));
    }
  }
}
