import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      period: const Duration(milliseconds: 1550),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
            shape: BoxShape.circle,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        subtitle: Container(
          width: 150,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
