import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TAnimatedCircularConatiner extends StatelessWidget {
  final double? width, height, raduis;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  const TAnimatedCircularConatiner({
    super.key,
    this.width = 400,
    this.height = 400,
    this.raduis = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = TColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
