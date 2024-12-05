import 'package:flutter/material.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/user_profile_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileImage(showEditBtn: true);
  }
}
