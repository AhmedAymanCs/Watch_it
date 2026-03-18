import 'package:supabase_flutter/supabase_flutter.dart';
import '../constants/api_constants.dart';

class SupabaseService {
  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: ApiConstants.supaBaseUrl,
      anonKey: ApiConstants.supaBaseAnonKey,
    );
  }
}
