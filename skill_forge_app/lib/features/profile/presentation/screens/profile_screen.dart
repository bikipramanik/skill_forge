import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/app/theme/app_colors.dart';
import 'package:skill_forge_app/core/widgets/profile_avatar_menu.dart';
import 'package:skill_forge_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:skill_forge_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:skill_forge_app/features/profile/presentation/widgets/profile_menu_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Image.asset("assets/Logo.png", height: 150),
          centerTitle: false,
          actions: const [
            Icon(Icons.search),
            SizedBox(width: 8),
            ProfileAvatarMenu(),
            SizedBox(width: 16),
          ],
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                children: [
                  // User Profile Header
                  ProfileHeader(
                    userName: state.userName,
                    userEmail: state.userEmail,
                    avatarPath: state.avatarPath,
                  ),
                  const SizedBox(height: 28),

                  // Account Section
                  ProfileMenuSection(
                    title: 'Account',
                    items: [
                      ProfileMenuItem(
                        icon: Icons.person_outline,
                        title: 'Edit Profile',
                        onTap: () {
                          // Navigate to Edit Profile
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.shopping_bag_outlined,
                        title: 'My Purchases',
                        onTap: () {
                          // Navigate to My Purchases
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.history,
                        title: 'Payment History',
                        onTap: () {
                          // Navigate to Payment History
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Preferences Section
                  ProfileMenuSection(
                    title: 'Preferences',
                    items: [
                      ProfileMenuItem(
                        icon: Icons.notifications_none_outlined,
                        title: 'Notifications',
                        onTap: () {
                          // Navigate to Notifications
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.language_outlined,
                        title: 'Language',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'English',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 20,
                            ),
                          ],
                        ),
                        onTap: () {
                          // Change Language
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Dark Mode',
                        trailing: Switch.adaptive(
                          value: state.isDarkMode,
                          activeTrackColor: AppColors.primary,
                          onChanged: (val) {
                            context.read<ProfileCubit>().toggleDarkMode(val);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Support Section
                  ProfileMenuSection(
                    title: 'Support',
                    items: [
                      ProfileMenuItem(
                        icon: Icons.help_outline,
                        title: 'Help Center',
                        onTap: () {
                          // Open Help Center
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy Policy',
                        onTap: () {
                          // Open Privacy Policy
                        },
                      ),
                      ProfileMenuItem(
                        icon: Icons.description_outlined,
                        title: 'Terms of Service',
                        onTap: () {
                          // Open Terms of Service
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Log Out Button Container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFFFCDD2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        // Confirm & Log Out user
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: AppColors.error,
                              size: 22,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
