import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_first_launch_use_case.dart';
import 'package:t_store/service_locator.dart';

class IsFirstLaunchCubit extends Cubit<bool> {
  IsFirstLaunchCubit() : super(true);

  void launchApp() async {
    try {
      bool isFirstLaunch = await getIt<IsFirstLaunchUseCase>().call();
      emit(isFirstLaunch);
    } catch (e) {
      emit(false);
    }
  }
}
