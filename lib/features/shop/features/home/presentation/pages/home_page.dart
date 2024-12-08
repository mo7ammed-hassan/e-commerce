import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/home_body_section.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/home_header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderSection(),
            HomeBodySection(),
          ],
        ),
      ),
    );
  }
}
