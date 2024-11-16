import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/navigation_menu_cubit.dart';

class TNavigationBody extends StatelessWidget {
  const TNavigationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationMenuCubit, int>(
      builder: (context, state) {
        return context.read<NavigationMenuCubit>().screens[state];
      },
    );
  }
}
