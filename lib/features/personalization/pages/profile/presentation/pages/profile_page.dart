import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_widget.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';
import 'package:t_store/features/personalization/manager/fetch_user_data_cubit.dart';
import 'package:t_store/features/personalization/manager/fetch_user_data_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/personal_information_section.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_information_section.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userData});
  final UserEntity userData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..fetchUserData(),
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Profile'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              children: [
                // header
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      BlocBuilder<UserDataCubit, UserDataState>(
                        builder: (context, state) {
                          if (state is FetchUserDataLoadedState) {
                            return TCircularImage(
                              isNetworkImage:
                                  state.userData.profilePicture != ''
                                      ? true
                                      : false,
                              width: 80,
                              height: 80,
                              image: state.userData.profilePicture != ''
                                  ? state.userData.profilePicture!
                                  : TImages.user,
                            );
                          }
                          return const ShimmerWidget(
                            height: 75,
                            width: 75,
                            shapeBorder: CircleBorder(),
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ProfileInformationSection(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                ///Heading
                const TSectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                PersonalInformationSection(user: userData),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
