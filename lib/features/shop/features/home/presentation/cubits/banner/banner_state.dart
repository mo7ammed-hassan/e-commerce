part of 'banner_cubit.dart';

sealed class BannerState {
  const BannerState();
}

final class BannerInitial extends BannerState {
  const BannerInitial();
}

final class BannerLoadingState extends BannerState {
  const BannerLoadingState();
}

final class BannerLoadedState extends BannerState {
  final List<BannerEntity> allBanners;

  const BannerLoadedState(this.allBanners);
}

final class BannerFailureState extends BannerState {
  final String errorMessage;

  const BannerFailureState(this.errorMessage);
}
