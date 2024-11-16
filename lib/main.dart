import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/presentation/pages/onboarding_page.dart';
import 'package:t_store/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T-Store',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingPage(),
    );
  }
}
