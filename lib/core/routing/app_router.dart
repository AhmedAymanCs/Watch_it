import 'package:flutter/material.dart';
import 'package:watch_it/splash/screens/splash_screen.dart';
import 'routes.dart';
import '../../features/video_player/presentation/screens/video_player_screen.dart';
import '../widgets/bottom_nav_bar.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarApp(),
        );
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.videoPlayer:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) =>
              VideoPlayerScreen(videoId: args['id']!, title: args['title']!),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No Route Found ${settings.name}")),
          ),
        );
    }
  }
}
