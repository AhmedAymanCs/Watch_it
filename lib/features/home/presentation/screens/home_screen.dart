import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/constants/app_colors.dart';
import 'package:watch_it/core/constants/app_strings.dart';
import 'package:watch_it/core/constants/app_style.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import '../../data/repo/home_repo.dart';
import 'widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeRepo())..fetchVideos(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.primaryGreen,
          centerTitle: true,
          title: Text(AppStrings.appTitle, style: AppStyle.bold18),
          elevation: 0,
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryGreen),
              );
            }
            if (state is HomeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, style: AppStyle.regular14),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => cubit.fetchVideos(),
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }
            if (state is HomeSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: state.videos.length,
                itemBuilder: (context, index) {
                  final video = state.videos[index];
                  return VideoCard(
                    videoId: video.youtubeId,
                    title: video.title,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
