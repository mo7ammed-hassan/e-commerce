import 'package:flutter/material.dart';
import 'package:t_store/features/shop/features/home/presentation/widgets/primary_header_conatiner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderConatiner(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
