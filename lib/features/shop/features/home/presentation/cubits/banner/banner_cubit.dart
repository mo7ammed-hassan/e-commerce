import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/domain/entites/banner_entity.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/banner_use_case.dart';
import 'package:t_store/service_locator.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  static final BannerCubit _singleton = BannerCubit._internal();

  factory BannerCubit() => _singleton;

  BannerCubit._internal() : super(const BannerInitial());

  final List<BannerEntity> allBanners = [];
  bool _hasFetched = false;

  Future<void> fetchBanners({bool forceRefresh = false}) async {
    if (!forceRefresh && _hasFetched && allBanners.isNotEmpty) {
      if (kDebugMode) {
        print("Banners already fetched, no need to fetch again.");
      }
      return;
    }

    emit(const BannerLoadingState());

    var result = await getIt<BannerUseCase>().call();

    result.fold(
      (error) {
        emit(BannerFailureState(error));
      },
      (categories) {
        allBanners.clear();
        allBanners.addAll(categories);
        emit(BannerLoadedState(allBanners));
        _hasFetched = true;
      },
    );
  }

  Future<void> refreshBanners() async {
    _hasFetched = false;
    await fetchBanners(forceRefresh: true);
  }

  @override
  Future<void> close() {
    if (kDebugMode) {
      print('Banner cubit closed');
    }
    return super.close();
  }

  // @override
  // Future<void> close() {
  //   // Prevent closing if singleton
  //   return Future.value();
  // }
}
