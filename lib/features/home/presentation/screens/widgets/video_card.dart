import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/constants/app_colors.dart';
import 'package:watch_it/core/constants/app_style.dart';
import 'package:watch_it/core/routing/routes.dart';
import 'package:watch_it/features/home/presentation/cubit/home_cubit.dart';
import 'package:watch_it/features/home/presentation/cubit/home_states.dart';

class VideoCard extends StatelessWidget {
  final String videoId;
  final String title;

  const VideoCard({super.key, required this.videoId, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.videoPlayer,
              arguments: {'id': videoId, 'title': title},
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    cubit.getImageUrl(videoId),
                    fit: BoxFit.cover,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: AppColors.iconContainerGrey,
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 48),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: AppStyle.semiBold16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
