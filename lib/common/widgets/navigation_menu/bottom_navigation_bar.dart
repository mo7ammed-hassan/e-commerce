import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/manager/cubits/navigation_menu_cubit.dart';

class TBottomNavigationBar extends StatelessWidget {
  const TBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationMenuCubit, int>(
      builder: (context, state) {
        return NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: state,
          onDestinationSelected: context.read<NavigationMenuCubit>().setScreen,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        );
      },
    );
  }
}
