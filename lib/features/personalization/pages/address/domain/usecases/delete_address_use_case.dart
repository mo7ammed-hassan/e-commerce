import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/personalization/pages/address/domain/repositories/address_repository.dart';

class DeleteAddressUseCase extends UseCases<void, dynamic> {
  final AddressRepository addressRepository;
  DeleteAddressUseCase(this.addressRepository);
  @override
  Future<void> call({params}) async {
    await addressRepository.deleteAddress(addressId: params!);
  }
}
