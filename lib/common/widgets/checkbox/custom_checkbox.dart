import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_state.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    // required this.isSelected,
    this.onChanged,
  });
  //final bool isSelected;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordAndSelectionCubit, PasswordAndSelectionState>(
      builder: (context, state) {
        final isSelected = state is PrivacyAcceptedState
            ? state.isPrivacyAccepted
            : state is RememberMeState
                ? state.isRemembered
                : false;

        return SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isSelected,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}
