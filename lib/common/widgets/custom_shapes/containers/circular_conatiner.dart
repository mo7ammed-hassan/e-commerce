import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  final double? width, height, raduis;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.raduis = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis!),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
