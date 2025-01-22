import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class UploadDataCard extends StatelessWidget {
  final IconData leadingIcon;
  final IconData trailingIcon;
  final String title;
  final String? subtitle;
  final Function()? onTap;

  const UploadDataCard({
    super.key,
    required this.leadingIcon,
    this.trailingIcon = Iconsax.arrow_circle_up,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: AppColors.primary, size: 30),
      trailing: Icon(trailingIcon, color: AppColors.primary, size: 28),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
