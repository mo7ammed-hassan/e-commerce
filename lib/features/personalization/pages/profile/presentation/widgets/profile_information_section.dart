import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_profile_menu.dart';
import 'package:t_store/features/personalization/manager/fetch_user_data_cubit.dart';
import 'package:t_store/features/personalization/manager/fetch_user_data_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_menu.dart';

class ProfileInformationSection extends StatelessWidget {
  const ProfileInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is FetchUserDataLoadedState) {
          return Column(
            children: [
              ProfileMenu(
                title: 'Name',
                value: '${state.userData.firstName} ${state.userData.lastName}',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Username',
                value: state.userData.username,
                onPressed: () {},
              ),
            ],
          );
        }
        return const Column(
          children: [
            ShimmerProfileMenu(),
            ShimmerProfileMenu(),
          ],
        );
      },
    );
  }
}
