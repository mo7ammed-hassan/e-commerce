import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/presentation/manager/cubits/onboarding/onboarding_cubit.dart';
import 'package:t_store/features/authentication/presentation/widgets/onboarding/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/presentation/widgets/onboarding/onboarding_next_button.dart';
import 'package:t_store/features/authentication/presentation/widgets/onboarding/onboarding_skip.dart';
import 'package:t_store/features/authentication/presentation/widgets/onboarding/onboarding_view.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<OnBoardingCubit, int>(
              builder: (context, state) {
                final cubit = context.read<OnBoardingCubit>();
                return PageView(
                  controller: cubit.pageController,
                  onPageChanged: cubit.updatePageIndicator,
                  children: const [
                    OnBoardingView(
                      image: TImages.onBoardingImage1,
                      title: TTexts.onBoardingTitle1,
                      subtitle: TTexts.onBoardingSubTitle1,
                    ),
                    OnBoardingView(
                      image: TImages.onBoardingImage2,
                      title: TTexts.onBoardingTitle2,
                      subtitle: TTexts.onBoardingSubTitle2,
                    ),
                    OnBoardingView(
                      image: TImages.onBoardingImage3,
                      title: TTexts.onBoardingTitle3,
                      subtitle: TTexts.onBoardingSubTitle3,
                    ),
                  ],
                );
              },
            ),
            const OnBoardingSkip(),
            const OnBoardingDotNavigation(),
            const OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
