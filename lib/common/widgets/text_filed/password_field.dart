import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_state.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordAndSelectionCubit, PasswordAndSelectionState>(
      builder: (context, state) {
        final isPasswordHidden =
            context.read<PasswordAndSelectionCubit>().isPasswordHidden;
        return TextFormField(
          obscureText: isPasswordHidden,
          controller: controller,
          validator: (value) => TValidator.validatePassword(value),
          decoration: InputDecoration(
            labelText: TTexts.password,
            prefixIcon: const Icon(Iconsax.password_check),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordHidden ? Iconsax.eye_slash : Iconsax.eye,
              ),
              onPressed: () {
                context
                    .read<PasswordAndSelectionCubit>()
                    .togglePasswordVisibility();
              },
            ),
          ),
        );
      },
    );
  }
}
