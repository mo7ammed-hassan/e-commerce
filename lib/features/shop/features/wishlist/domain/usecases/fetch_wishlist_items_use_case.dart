import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/shop/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:t_store/service_locator.dart';

class FetchWishlistItemsUseCase extends UseCases {
  @override
  Future call({params}) async {
    return await getIt<WishlistRepository>().fetchWishlist();
  }
}
