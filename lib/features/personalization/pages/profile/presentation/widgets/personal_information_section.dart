import 'package:flutter/material.dart';
import 'package:t_store/features/personalization/domain/entites/user_entity.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/profile_menu.dart';

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
