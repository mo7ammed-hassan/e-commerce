import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_iamge_text.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/category/category_cubit.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/category/category_state.dart';
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
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                    context.read<CategoryCubit>().getAllCategories();
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: state.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = state.featuredCategories[index];

                    return TVerticalImageText(
                      isNetworkImage: false,
                      image: category.image,
                      title: category.name,
                      onTap: () {
                        context.pushPage(const SubCategoryPage());
                      },
                    );
                  },
                ),
              ),
            );
          } else {
            // return _errorWiget(context);
            return Skeletonizer(
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TVerticalImageText(
                    isNetworkImage: false,
                    image: TImages.sportIcon,
                    title: 'Sport',
                    onTap: () {},
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  // Center _errorWiget(BuildContext context) {
  //   return Center(
  //     child: Text(
  //       'No Data Found!',
  //       style:
  //           Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
  //     ),
  //   );
  // }
}
