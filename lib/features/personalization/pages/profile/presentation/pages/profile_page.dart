import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_widget.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/presentation/pages/login_page.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/personalization/pages/profile/cuits/delete_user_account_cubit.dart';
import 'package:t_store/features/personalization/pages/profile/cuits/delete_user_account_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/pages/re_authentication_user_login_from.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/personal_information_section.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_information_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.userData});
  final UserEntity? userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state is FetchUserDataLoadedState) {
                          return TCircularImage(
                            isNetworkImage: state.userData.profilePicture != ''
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
              PersonalInformationSection(user: userData!),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              BlocProvider(
                create: (context) => DeleteUserAccountCubit(),
                child: Center(
                  child: BlocListener<DeleteUserAccountCubit,
                      DeleteUserAccountState>(
                    listener: (context, state) {
                      if (state is ReAuthUserState) {
                        context.pushPage(const ReAuthLoginFrom());
                      } else if (state is DeleteUserAccountSuccess) {
                        context.removeAll(const LoginPage());
                      }
                    },
                    child: Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: () => deleteAcountWarningPopup(context),
                          child: const Text(
                            'Close Account',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteAcountWarningPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reservable and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () =>
            context.read<DeleteUserAccountCubit>().deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: TColors.warning),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      ),
    );
  }
}
