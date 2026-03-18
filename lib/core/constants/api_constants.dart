import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String supaBaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static final String supaBaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static const String videosTable = 'videos';
  static const String profileTable = 'profile';
}
