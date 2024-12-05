import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> fetchUserData();
  Future<Either> updateUserField(Map<String, dynamic> data);
  Future<Either> reAuthenticateWithEmailAndPassword(
      String email, String password);
  Future<Either> deleteUserAccount();
  Future<Either> deleteAccount();
  Future<Either> uploadUserImage(String path, XFile? image);
}
