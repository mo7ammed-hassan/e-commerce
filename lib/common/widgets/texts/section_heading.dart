import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSectionHeading extends StatelessWidget {
  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View All',
    this.showActionButton = true,
    this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: AppColors.primary),
            ),
          )
      ],
    );
  }
}
