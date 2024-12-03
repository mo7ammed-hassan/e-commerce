import 'package:dartz/dartz.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> fetchUserData();
}
