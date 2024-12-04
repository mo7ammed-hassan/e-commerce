import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_list_tile.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/pages/profile_page.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});
  // user model
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is FetchUserDataLoadedState) {
          return ListTile(
            leading: const TCircularImage(
              image: TImages.user,
              width: 50,
              height: 50,
              padding: 0,
            ),
            title: Text(
              "${state.userData.firstName} ${state.userData.lastName}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              state.userData.userEmail,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.white),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () {
                context.pushPage(ProfilePage(userData: state.userData));
              },
              icon: const Icon(
                Iconsax.edit,
                color: TColors.white,
              ),
            ),
          );
        }

        return const ShimmerListTile();
      },
    );
  }
}
