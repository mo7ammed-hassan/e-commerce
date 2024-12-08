import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/domain/entites/banner_entity.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/banner_use_case.dart';
import 'package:t_store/service_locator.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(const BannerInitial());

  final List<BannerEntity> allBanners = [];

  void getAllCategories() async {
    emit(const BannerLoadingState());

    // fetch banners
    var result = await getIt<BannerUseCase>().call();

    result.fold(
      (error) {
        emit(BannerFailureState(error));
      },
      (categories) {
        allBanners.clear();
        allBanners.addAll(categories);

        emit(BannerLoadedState(allBanners));
      },
    );
  }
}
