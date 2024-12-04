import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/pages/change_name_page.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangNameForm extends StatelessWidget {
  const ChangNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UserCubit>().fromKey,
      child: Column(
        children: [
          TextFormField(
            controller: context.read<UserCubit>().firstNameController,
            validator: (value) =>
                TValidator.validateEmptyText('First Name', value),
            decoration: const InputDecoration(
              labelText: TTexts.firstName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            controller: context.read<UserCubit>().lastNameController,
            validator: (value) =>
                TValidator.validateEmptyText('Last Name', value),
            decoration: const InputDecoration(
              labelText: TTexts.lastName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: BlocListener<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UpdateUserDataLoadingState) {
                  TFullScreenLoader.openLoadingDialog(
                    'We are processing your information...',
                    TImages.docerAnimation,
                  );
                } else if (state is UpdateUserSuccessState) {
                  TFullScreenLoader.stopLoading();
                  context.removePage(const ChangeNamePage());
                  TLoaders.successSnackBar(
                    title: 'Congratulations',
                    message: state.message,
                  );
                }
              },
              child: Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().updateUserFiled();
                  },
                  child: const Text('Save'),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
