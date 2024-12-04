import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:t_store/app_entry_point.dart';
import 'package:t_store/common/manager/cubits/launch_app/launch_app_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/firebase_options.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Preserve the native splash screen.
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Initialize Firebase App with custom options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize GetX Local Storage
  await GetStorage.init();

  // Initialize Service Locator
  await initializeDependencies();

  // Remove the splash screen once initialization is complete.
  FlutterNativeSplash.remove();

  runApp(BlocProvider(
    create: (context) => LaunchAppCubit()..launchApp(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..fetchUserData(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'T-Store',
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: const AppEntryPoint(),
      ),
    );
  }
}
