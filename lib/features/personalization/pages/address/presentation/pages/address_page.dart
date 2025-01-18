import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_cubit.dart';
import 'package:t_store/features/personalization/pages/address/presentation/pages/add_new_address_page.dart';
import 'package:t_store/features/personalization/pages/address/presentation/widgets/build_addresses_list_view.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit()..fetchAllAddresses(),
      child: Scaffold(
        floatingActionButton: _buildFloatingActionButton(),
        appBar: _buildAppBar(context),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwItems),
          child: BuildAddressesListView(),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      //👈 Wrap with Builder
      builder: (context) {
        final addressCubit = context.read<AddressCubit>();
        return FloatingActionButton(
          backgroundColor: TColors.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: addressCubit, // Pass the ✅ Same instance
                  child: const AddNewAddressPage(),
                ),
              ),
            );
          },
          child: const Icon(
            Iconsax.add,
            color: TColors.white,
          ),
        );
      },
    );
  }

  TAppBar _buildAppBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Address',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
