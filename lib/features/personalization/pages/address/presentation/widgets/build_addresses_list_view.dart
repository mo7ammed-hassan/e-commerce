import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_cubit.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_state.dart';
import 'package:t_store/features/personalization/pages/address/presentation/widgets/single_address_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BuildAddressesListView extends StatelessWidget {
  const BuildAddressesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      buildWhen: (previous, current) {
        if (current is FetchAddressesSuccessState ||
            current is FetchAddressesFailureState ||
            current is FetchAddressesLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        // Loading state
        if (state is FetchAddressesLoadingState) {
          return _loadingWidget();
        }

        if (state is FetchAddressesSuccessState) {
          if (state.addresses.isEmpty) {
            return const Center(
              child: Text(
                'You don\'t have any addresses yet. Add one now! 🤓',
                style: TextStyle(fontSize: TSizes.md),
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.separated(
            itemCount: state.addresses.length,
            itemBuilder: (context, index) => SingleAddressCard(
              address: state.addresses[index],
              onTap: () => context
                  .read<AddressCubit>()
                  .selecteAddress(state.addresses[index]),
              onLongPress: () {
                _showBottomSheet(
                  addressCubit: context.read<AddressCubit>(),
                  context,
                  addressId: state.addresses[index].id,
                );
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          );
        }

        return const Center(
          child: Text(
            'There was an error, Please try again later 🫤',
            style: TextStyle(fontSize: TSizes.md),
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: TColors.primary,
      ),
    );
  }

  // Function to show the Bottom Sheet for deletion
  void _showBottomSheet(BuildContext context,
      {required AddressCubit addressCubit, required String addressId}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to delete this address?🤔',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      addressCubit.deleteAddress(
                        addressId: addressId,
                      ); // Call deleteAddress
                    },
                    child: const Text(
                      'Delete ❌',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
