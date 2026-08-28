import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String avatarPath;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
   required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Large Circular Avatar
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 46,
            backgroundColor: const Color(0xFFE2E8F0),
            backgroundImage: AssetImage(avatarPath),
            onBackgroundImageError: (exception, stackTrace) {},
            child: avatarPath.isEmpty
                ? const Icon(Icons.person, size: 48, color: Colors.grey)
                : null,
          ),
        ),
        const SizedBox(height: 14),

        // User Name
        Text(
          userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 4),

        // User Email
        Text(
          userEmail,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),

    ],
    );
  }
}
