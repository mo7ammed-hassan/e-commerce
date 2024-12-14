import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/features/all_products/presentation/cubits/products_cubit.dart';
import 'package:t_store/features/shop/features/all_products/presentation/pages/all_products_page.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/popular_products_section.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/slider/promo_slider.dart';
import 'package:t_store/service_locator.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class HomeBodySection extends StatefulWidget {
  const HomeBodySection({super.key});

  @override
  State<HomeBodySection> createState() => _HomeBodySectionState();
}

class _HomeBodySectionState extends State<HomeBodySection> {
  @override
  void dispose() {
    ProductsCubit().close();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final productsCubit = getIt.get<ProductsCubit>();
    return BlocProvider.value(
      value: productsCubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.spaceBtwItems,
          vertical: TSizes.defaultSpace,
        ),
        child: Column(
          children: [
            const TPromoSlider(),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSectionHeading(
              title: 'Popular Products',
              onPressed: () {
                context.pushPage(const AllProductsPage());
              },
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const PopularProductsSection(),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSectionHeading(
              title: 'Featured Products',
              onPressed: () {
                context.pushPage(const AllProductsPage());
              },
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const PopularProductsSection(),
          ],
        ),
      ),
    );
  }
}
