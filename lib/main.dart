import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:t_store/app_entry_point.dart';
import 'package:t_store/bloc_observier.dart';
import 'package:t_store/common/core/hive_boxes/open_boxes.dart';
import 'package:t_store/common/cubits/launch_app/launch_app_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/shop/features/home/domain/entites/category_entity.dart';
import 'package:t_store/features/shop/features/wishlist/data/model/wishlist_model.dart';
import 'package:t_store/firebase_options.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Preserve the native splash screen.
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Initializes Hive
  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(CategoryEntityAdapter());

  Hive.registerAdapter(WishlistModelAdapter());

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase App with custom options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize GetX Local Storage
  await GetStorage.init();

  // open the user's wishlist box
  await OpenBoxes().openUserWishlistBox();

  // Initialize Service Locator
  await initializeDependencies();

  // Remove the splash screen once initialization is complete.
  FlutterNativeSplash.remove();
  // Initialize Bloc Observer
  Bloc.observer = MyBlocObserver();

  // Run the app
  runApp(
    BlocProvider(
      create: (context) => LaunchAppCubit()..launchApp(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
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

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // Cleanup logic when app is closed
      getIt
          .reset(); // This will reset and dispose all objects registered with getIt
    }
  }
}
