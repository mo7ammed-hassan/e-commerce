import 'package:flutter/material.dart';

extension NavigationX on BuildContext {
  void removeAll(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page), 
      (Route<dynamic> route) => false, // remove all pages from memory "stack"
    );
  }
}
