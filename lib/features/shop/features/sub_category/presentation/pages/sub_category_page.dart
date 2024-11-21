import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/features/shop/features/sub_category/presentation/widgets/equipment_section.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwItems,
            vertical: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              TRoundedImage(
                width: double.infinity,
                aplayImageRaduis: true,
                imageUrl: TImages.banner3,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              EquipmentSection(title: 'Sports Equipments'),
              SizedBox(height: TSizes.spaceBtwSections),
              EquipmentSection(title: 'Sports Shose'),
              SizedBox(height: TSizes.spaceBtwSections),
              EquipmentSection(title: 'Trac suits'),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  TAppBar _appBar(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      title: Text(
        'Sport',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
