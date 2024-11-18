import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              // backgroundColor: THelperFunctions.isDarkMode(context)
              //     ? TColors.black
              //     : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchConatiner(
                      text: 'Search in Store',
                      padding: EdgeInsets.zero,
                      showBackground: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(title: 'Future Brands', onPressed: () {}),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) => const TBrandCard(),
                    ),
                  ],
                ),
              ),

              // Tabs --
              
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
