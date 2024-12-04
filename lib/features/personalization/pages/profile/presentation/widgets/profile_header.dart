import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_widget.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/utils/constants/images_strings.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is FetchUserDataLoadedState) {
          return Column(
            children: [
              TCircularImage(
                isNetworkImage: state.userData.profilePicture!.isNotEmpty,
                image: state.userData.profilePicture!.isNotEmpty
                    ? state.userData.profilePicture!
                    : TImages.user,
                width: 80,
                height: 80,
              ),
              TextButton(
                onPressed: () {}, // Trigger change picture logic
                child: const Text('Change Profile Picture'),
              ),
            ],
          );
        }
        return const ShimmerWidget(
          height: 75,
          width: 75,
          shapeBorder: CircleBorder(),
        );
      },
    );
  }
}