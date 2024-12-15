import 'package:flutter/material.dart';

extension NavigationX on BuildContext {
  void removeAll(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false, // remove all pages from memory "stack"
    );
  }

  void removeAllSaveStack(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) =>
          true, // not remove all pages from memory "stack"
    );
  }

  void removePage(Widget page) {
    Navigator.pop(this); // remove the current page from memory
  }

  void popPage(BuildContext context) {
    Navigator.pop(context); // remove the current page from memory
  }

  void pushPage(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
