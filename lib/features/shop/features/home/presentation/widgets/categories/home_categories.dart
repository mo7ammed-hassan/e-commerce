import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_iamge_text.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/category/category_cubit.dart';
import 'package:t_store/features/shop/features/sub_category/presentation/pages/sub_category_page.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const CategoryShimmer();
          }
          if (state is CategoryLoadedState) {
            return SizedBox(
              height: 85,
              child: ListView.builder(
                itemCount: 6, //state.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  // final category = state.featuredCategories[index];

                  return TVerticalImageText(
                    isNetworkImage: false,
                    image: TImages.shoeIcon,
                    title: 'Shose Category',
                    onTap: () {
                      context.pushPage(const SubCategoryPage());
                    },
                  );
                },
              ),
            );
          } else {
            return _errorWiget(context);
          }
        },
      ),
    );
  }

  Center _errorWiget(BuildContext context) {
    return Center(
      child: Text(
        'No Data Found!',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
    );
  }
}
