import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizantal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwItems,
            vertical: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const TRoundedImage(
                width: double.infinity,
                aplayImageRaduis: true,
                imageUrl: TImages.banner3,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Equipments',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ProductCardHorizantal(),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                    ),
                  )
                ],
              )
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
