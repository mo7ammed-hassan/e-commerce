import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/authentication/domain/repository/authentication_repository.dart';
import 'package:t_store/service_locator.dart';

class LogoutUseCase extends UseCases<void, dynamic> {
  @override
  Future<void> call({dynamic params}) async {
    return await getIt<AuthenticationRepository>().logout();
  }
}
