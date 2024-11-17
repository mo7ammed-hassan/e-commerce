import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/home_app_bar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_conatiner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderConatiner(
              child: Column(
                children: [
                  THomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
