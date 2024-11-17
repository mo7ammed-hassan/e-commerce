import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widgets.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_conatiner.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TPrimaryHeaderConatiner extends StatelessWidget {
  final Widget child;
  const TPrimaryHeaderConatiner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: TColors.primary,
        ),
        child: SizedBox(
          height: THelperFunctions.screenHeight() * 0.45,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
