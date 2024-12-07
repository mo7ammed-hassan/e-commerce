import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/pages/settings/presentation/widgets/main_record_section.dart';
import 'package:t_store/features/personalization/pages/settings/presentation/widgets/relationships_section.dart';
import 'package:t_store/utils/constants/sizes.dart';

class LoadDataPage extends StatelessWidget {
  const LoadDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        child: Column(
          children: [
            const TSectionHeading(
                title: 'Main Record', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            const MainRecordSection(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSectionHeading(
                title: 'Relationships', showActionButton: false),
            Text(
              'Make sure you have already uploaded all the content above',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const RelationshipsSection(),
          ],
        ),
      ),
    );
  }

  TAppBar _appBar() {
    return const TAppBar(
      showBackArrow: true,
      title: Text(
        'Upload Data',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}
