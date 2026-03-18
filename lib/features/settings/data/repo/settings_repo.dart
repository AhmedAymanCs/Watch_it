import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/supabase_service.dart';
import '../models/profile_model.dart';

class SettingsRepo {
  Future<ProfileModel> fetchProfile() async {
    final response = await SupabaseService.client
        .from(ApiConstants.profileTable)
        .select()
        .single();

    return ProfileModel.fromJson(response);
  }
}
