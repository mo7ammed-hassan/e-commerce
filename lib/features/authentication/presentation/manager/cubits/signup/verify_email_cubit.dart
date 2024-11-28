import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/domain/use_cases/is_verified_email_use_case.dart';
import 'package:t_store/features/authentication/domain/use_cases/verify_email_usecase.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/signup/verify_email_state.dart';
import 'package:t_store/service_locator.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailLoadingState());

  void sendVerifyEmail() async {
    emit(VerifyEmailLoadingState());

    bool isVerified = await getIt<IsVerifiedEmailUseCase>().call();

    if (!isVerified) {
      var result = await getIt<VerifyEmailUsecase>().call();

      result.fold(
        (errorMessage) => emit(VerifyEmailErrorState(errorMessage)),
        (successMessage) {
          emit(SuccessSendVerifyEmailState(successMessage));
          checkEmailVerification();
        },
      );
    } else {
      checkEmailVerification();
    }
  }

  void checkEmailVerification() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        bool isVerified = await getIt<IsVerifiedEmailUseCase>().call();
        if (isVerified) {
          timer.cancel();
          emit(VerifiyEmailSuccessState("Email Verified!"));
        }
      },
    );
  }
}
