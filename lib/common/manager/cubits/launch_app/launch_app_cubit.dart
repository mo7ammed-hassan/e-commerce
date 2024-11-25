import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_first_launch_use_case.dart';
import 'package:t_store/service_locator.dart';

class LaunchAppCubit extends Cubit<bool> {
  LaunchAppCubit() : super(true);

  void launchApp() async {
    try {
      bool isFirstLaunch = await getIt<IsFirstLaunchUseCase>().call();

      emit(isFirstLaunch);
    } catch (e) {
      emit(false);
    }
  }
}
// if UnAuthenticated and isFirstLaunch >> emit isFirstLaunch
// if UnAuthenticated and !isFirstLaunch >> emit UnAuthenticated
/*


class LaunchAppCubit extends Cubit<LaunchAppState> {
  LaunchAppCubit() : super(LaunchAppInitial());

  Future<void> launchApp() async {
    try {
      final isFirstLaunch = await getIt<IsFirstLaunchUseCase>().call();
      final isAuthenticated = await getIt<IsLoggedInUseCase>().call();

      if (!isAuthenticated) {
        if (isFirstLaunch) {
          emit(FirstLaunch());
        } else {
          emit(UnAuthenticated());
        }
      } else {
        emit(Authenticated());
      }
    } catch (e) {
      emit(LaunchAppError());
    }
  }
}

*/
