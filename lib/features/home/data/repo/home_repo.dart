import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/supabase_service.dart';
import '../models/video_model.dart';

class HomeRepo {
  Future<List<VideoModel>> fetchVideos() async {
    final response = await SupabaseService.client
        .from(ApiConstants.videosTable)
        .select()
        .order('created_at', ascending: true);
    return (response as List).map((json) => VideoModel.fromJson(json)).toList();
  }
}
