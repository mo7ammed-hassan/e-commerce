import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 28),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
