import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_state.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordAndSelectionCubit, PasswordAndSelectionState>(
      builder: (context, state) {
        final isSelected = context.read<PasswordAndSelectionCubit>().isSelected;
        return SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isSelected,
            onChanged: (value) {
              context
                  .read<PasswordAndSelectionCubit>()
                  .toggleUserSelection(value!);
            },
          ),
        );
      },
    );
  }
}
