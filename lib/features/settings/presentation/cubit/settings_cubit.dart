import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/settings_repo.dart';
import 'settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  final SettingsRepo _settingsRepo;

  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  Future<void> fetchProfile() async {
    emit(SettingsLoading());
    try {
      final profile = await _settingsRepo.fetchProfile();
      emit(SettingsSuccess(profile));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}
