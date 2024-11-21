import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_iamge_text.dart';
import 'package:t_store/features/shop/features/sub_category/presentation/pages/sub_category_page.dart';
import 'package:t_store/utils/constants/images_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'Shose Category',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubCategoryPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
