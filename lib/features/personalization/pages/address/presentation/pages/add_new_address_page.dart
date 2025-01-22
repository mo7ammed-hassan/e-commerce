import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_cubit.dart';
import 'package:t_store/features/personalization/pages/address/presentation/cubits/address_state.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/validators/validation.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.spaceBtwItems),
          child: Form(
            key: addressCubit.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: addressCubit.nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      TValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: addressCubit.phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (value) => TValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.streetController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            TValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.postalCodeController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            TValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.cityController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            TValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.stateController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            TValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: addressCubit.countryController,
                  validator: (value) =>
                      TValidator.validateEmptyText('Country', value),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                BlocListener<AddressCubit, AddressState>(
                  listener: (context, state) {
                    if (state is AddAddressSuccessState) {
                      Navigator.pop(context);
                      Loaders.customToast(
                        message: 'Address added successfully 🥳',
                      );
                    }

                    if (state is AddAddressFailureState) {
                      Loaders.errorSnackBar(
                        title: 'Error',
                        message: 'There was an error adding your address',
                      );
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (addressCubit.validateForm()) {
                          await addressCubit.addNewAddress();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
