import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_iamge_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            height: THelperFunctions.screenHeight() * 0.15,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return TVerticalImageText(
                  image: TImages.shoeIcon,
                  title: 'Shose Category',
                  onTap: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
