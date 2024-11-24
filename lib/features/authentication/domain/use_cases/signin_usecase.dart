import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/authentication/data/models/user_signin_model.dart';

class SigninUsecase extends UseCases<Either,UserSigninModel> {
  @override
  Future<Either> call({UserSigninModel? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}