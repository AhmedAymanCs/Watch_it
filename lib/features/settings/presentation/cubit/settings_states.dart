import '../../data/models/profile_model.dart';

abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class SettingsLoading extends SettingsStates {}

class SettingsSuccess extends SettingsStates {
  final ProfileModel profile;
  SettingsSuccess(this.profile);
}

class SettingsError extends SettingsStates {
  final String message;
  SettingsError(this.message);
}
