import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/models/dummy_data.dart';
import 'package:t_store/features/personalization/pages/settings/presentation/cubits/cubit/upload_data_cubit.dart';
import 'package:t_store/features/personalization/pages/settings/presentation/widgets/upload_data_card.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class MainRecordSection extends StatelessWidget {
  const MainRecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadDataCubit, UploadDataState>(
      listener: (context, state) {
        if (state is UploadDataloading) {
          TFullScreenLoader.openLoadingDialog(
            'We are uploading ${state.message} data...',
            TImages.packaging,
          );
        }
        if (state is UploadDataSuccess) {
          TFullScreenLoader.stopLoading();
          TLoaders.successSnackBar(
            title: 'Congratulations',
            message: state.message,
          );
        }
        if (state is UploadDataFailure) {
          TFullScreenLoader.stopLoading();
          TLoaders.errorSnackBar(
            title: 'Error',
            message: state.error.toString(),
          );
        }
      },
      child: Column(
        children: [
          UploadDataCard(
            onTap: () => context.read<UploadDataCubit>().uploadDummyData(
                data: DummyData.categories, collection: 'Categories'),
            leadingIcon: Iconsax.menu,
            title: 'Upload Categories',
          ),
          const UploadDataCard(
            leadingIcon: Iconsax.shop,
            title: 'Upload Brands',
          ),
          UploadDataCard(
            onTap: () => context.read<UploadDataCubit>().uploadProductDummyData(
                data: DummyData.products, collection: 'Products'),
            leadingIcon: Iconsax.shopping_cart,
            title: 'Upload Products',
          ),
          UploadDataCard(
            onTap: () => context.read<UploadDataCubit>().uploadDummyData(
                data: DummyData.banners, collection: 'Banners'),
            leadingIcon: Iconsax.image,
            title: 'Upload Banners',
          ),
        ],
      ),
    );
  }
}
