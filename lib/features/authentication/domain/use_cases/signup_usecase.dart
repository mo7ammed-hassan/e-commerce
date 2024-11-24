import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/authentication/data/models/user_creation_model.dart';

class SignupUsecase extends UseCases<Either,UserCreationModel> {
  @override
  Future<Either> call({UserCreationModel? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}