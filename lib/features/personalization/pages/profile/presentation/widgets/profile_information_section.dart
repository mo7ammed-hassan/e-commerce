import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_profile_menu.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/pages/change_name_page.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_menu.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class ProfileInformationSection extends StatelessWidget {
  const ProfileInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is FetchUserDataLoadedState) {
          return Column(
            children: [
              ProfileMenu(
                title: 'Name',
                value: '${state.userData.firstName} ${state.userData.lastName}',
                onPressed: () {
                  context.pushPage(
                    const ChangeNamePage(),
                  );
                },
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
