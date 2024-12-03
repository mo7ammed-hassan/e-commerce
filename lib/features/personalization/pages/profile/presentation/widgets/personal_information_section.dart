import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_menu.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenu(
          title: 'User ID',
          value: user.userId!,
          onPressed: () {},
        ),
        ProfileMenu(
          title: 'E-mail',
          value: user.userEmail,
          onPressed: () {},
        ),
        ProfileMenu(
          title: 'Phone Number',
          value: '+201096493188',
          onPressed: () {},
        ),
        ProfileMenu(
          title: 'Gender',
          value: 'Male',
          onPressed: () {},
        ),
        ProfileMenu(
          title: 'Date of Birth',
          value: '22 March 2003',
          onPressed: () {},
        ),
      ],
    );
  }
}

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Colors.grey,
        ),
      ),
    );
  }
}
