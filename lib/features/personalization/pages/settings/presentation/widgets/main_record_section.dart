import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/pages/settings/presentation/widgets/upload_data_card.dart';

class MainRecordSection extends StatelessWidget {
  const MainRecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UploadDataCard(
          leadingIcon: Iconsax.menu,
          title: 'Upload Categories',
        ),
        UploadDataCard(
          leadingIcon: Iconsax.shop,
          title: 'Upload Brands',
        ),
        UploadDataCard(
          leadingIcon: Iconsax.shopping_cart,
          title: 'Upload Products',
        ),
        UploadDataCard(
          leadingIcon: Iconsax.image,
          title: 'Upload Banners',
        ),
      ],
    );
  }
}
