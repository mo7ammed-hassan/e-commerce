import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/service_locator.dart';

class SendEmailVerificationUsecase extends UseCases<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<AuthenticationRepository>().sendEmailVerification();
  }
}
