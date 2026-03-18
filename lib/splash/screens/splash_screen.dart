import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/constants/app_colors.dart';
import 'package:watch_it/core/constants/image_manager.dart';
import 'package:watch_it/core/routing/routes.dart';
import 'package:watch_it/splash/logic/cubit.dart';
import 'package:watch_it/splash/logic/states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startSplash(),
      child: BlocListener<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (_) => false,
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Image.asset(
                  ImageManager.logo,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Text(
                  'Watch It',
                  style: TextStyle(color: AppColors.textDark, fontSize: 20),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
