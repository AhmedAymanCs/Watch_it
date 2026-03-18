import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/constants/app_colors.dart';
import 'package:watch_it/core/constants/app_strings.dart';
import 'package:watch_it/core/constants/app_style.dart';
import 'package:watch_it/core/helpers/lunch_url.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_states.dart';
import '../../data/repo/settings_repo.dart';
import 'widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(SettingsRepo())..fetchProfile(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(AppStrings.settings, style: AppStyle.bold20),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.settings, color: AppColors.textDark),
            ),
          ],
        ),
        body: BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) {
            final cubit = context.read<SettingsCubit>();
            if (state is SettingsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryGreen),
              );
            }
            if (state is SettingsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, style: AppStyle.regular14),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => cubit.fetchProfile(),
                      child: const Text(''),
                    ),
                  ],
                ),
              );
            }
            if (state is SettingsSuccess) {
              final profile = state.profile;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildSectionHeader(AppStrings.sectionInterface),
                  const SizedBox(height: 8),
                  SettingsItem(
                    icon: Icons.play_circle_outline,
                    label: AppStrings.youtubeChannel,
                    iconContainerColor: AppColors.iconContainerGreen,
                    iconColor: AppColors.primaryGreen,
                    onTap: () => openUrl(context, profile.youtubeUrl),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader(AppStrings.sectionGeneral),
                  const SizedBox(height: 8),
                  SettingsItem(
                    icon: Icons.info_outline,
                    label: AppStrings.aboutDeveloper,
                    iconContainerColor: AppColors.iconContainerGrey,
                    iconColor: AppColors.primaryGreen,
                    onTap: () {
                      if (profile.aboutDeveloper != null) {
                        openUrl(context, profile.aboutDeveloper!);
                      }
                    },
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(title, style: AppStyle.regular14),
    );
  }
}
