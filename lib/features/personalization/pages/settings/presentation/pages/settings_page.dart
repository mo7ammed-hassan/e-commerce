import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_conatiner.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --Header
            TPrimaryHeaderConatiner(
              child: Column(
                children: [],
              ),
            ),

            // --Body
          ],
        ),
      ),
    );
  }
}
