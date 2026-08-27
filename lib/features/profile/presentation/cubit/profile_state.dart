part of 'profile_cubit.dart';

class ProfileState {
  final String userName;
  final String userEmail;
  final String avatarPath;
  final bool isDarkMode;
  final bool notificationsEnabled;

  const ProfileState({
    this.userName = 'Alex Johnson',
    this.userEmail = 'alex.j@example.com',
    this.avatarPath = 'assets/images/user_alex_johnson.jpg',
    this.isDarkMode = false,
    this.notificationsEnabled = true,
  });

  ProfileState copyWith({
    String? userName,
    String? userEmail,
    String? membershipStatus,
    String? avatarPath,
    bool? isDarkMode,
    bool? notificationsEnabled,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      avatarPath: avatarPath ?? this.avatarPath,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
