import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenuCubit extends Cubit<int> {
  NavigationMenuCubit() : super(0);

  final List<Widget> screens = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.brown),
  ];

  void setScreen(index) => emit(index);
}
