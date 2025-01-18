import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/personalization/pages/address/domain/repositories/address_repository.dart';

class FetchAllAddressUseCase extends UseCases<Either, dynamic> {
  final AddressRepository addressRepository;
  FetchAllAddressUseCase(this.addressRepository);
  @override
  Future<Either> call({params}) async {
    return await addressRepository.fetchAllAddresses();
  }
}
