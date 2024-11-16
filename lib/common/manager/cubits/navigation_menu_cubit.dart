import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/presentation/pages/home_page.dart';

class NavigationMenuCubit extends Cubit<int> {
  NavigationMenuCubit() : super(0);

  final List<Widget> screens = [
    const HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.brown),
  ];

  void setScreen(index) => emit(index);
}
