import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/user_profile_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProfileImage(
      showEditBtn: true,
      image: context.read<UserCubit>().previousImage,
    );
  }
}
