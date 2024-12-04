import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/password_and_selection/password_and_selection_cubit.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/pages/profile/cuits/re_auth_user_cubit.dart';
import 'package:t_store/features/personalization/pages/profile/presentation/widgets/re_auth_user_form.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ReAuthLoginFrom extends StatelessWidget {
  const ReAuthLoginFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReAuthUserCubit(),
      child:  Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Re-Authentication User'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.spaceBtwItems),
          child: BlocProvider(
            create: (context) => PasswordAndSelectionCubit(),
            child: const ReAuthUserForm(),
          ),
        ),
      ),
    );
  }
}
