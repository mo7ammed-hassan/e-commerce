import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_cubit.dart';
import 'package:t_store/features/personalization/pages/address/presentation/widgets/add_address_form.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceBtwItems),
          child: AddAddressForm(addressCubit: addressCubit),
        ),
      ),
    );
  }

  TAppBar _buildAppBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Add new Address',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
