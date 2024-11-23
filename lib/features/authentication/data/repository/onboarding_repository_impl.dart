import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  OnboardingRepositoryImpl();
  @override
  Future<bool> isFirstLaunch() async {
    final GetStorage storage = GetStorage();

    await storage.writeIfNull('isFirstLaunch', true);

    return storage.read<bool>('isFirstLaunch') ?? true;
  }
}
