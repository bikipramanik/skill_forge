import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/app/theme/app_colors.dart';
import 'package:skill_forge_app/features/main/presentation/cubit/main_cubit.dart';

class ProfileAvatarMenu extends StatelessWidget {
  final double radius;
  final String avatarPath;

  const ProfileAvatarMenu({
    super.key,
    this.radius = 18,
    this.avatarPath = 'assets/images/user_alex_johnson.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFEFEFEF), width: 1),
          ),
          elevation: 6,
          color: Colors.white,
        ),
      ),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 48),
        tooltip: 'User Menu',
        onSelected: (value) {
          switch (value) {
            case 'profile':
              try {
                context.read<MainCubit>().setSelectedIndex(4);
              } catch (_) {
                // Fallback if not inside MainShellScreen
              }
              break;
            case 'cart':
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening My Cart...'),
                  duration: Duration(seconds: 1),
                ),
              );
              break;
            case 'logout':
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: const Text('Log Out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logged out successfully'),
                          ),
                        );
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              );
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: const Color(0xFFE2E8F0),
            backgroundImage: AssetImage(avatarPath),
            onBackgroundImageError: (exception, stackTrace) {},
            child: avatarPath.isEmpty
                ? Icon(Icons.person, size: radius * 1.2, color: Colors.grey)
                : null,
          ),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: const [
                Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'cart',
            child: Row(
              children: const [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  'My Cart',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(height: 1),
          PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: AppColors.error,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
