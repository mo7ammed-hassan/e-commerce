import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.image,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final String image;
  final double width, height, padding;

  final Color? backgroundColor;
  final BoxFit fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
          fit: fit,
          color: isDark ? TColors.white : TColors.dark,
        ),
      ),
    );
  }
}
