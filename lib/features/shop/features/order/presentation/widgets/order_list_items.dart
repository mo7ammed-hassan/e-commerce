import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/features/shop/features/order/presentation/cubits/order_cubit.dart';
import 'package:t_store/features/shop/features/order/presentation/cubits/order_state.dart';
import 'package:t_store/features/shop/features/order/presentation/widgets/order_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderFailureState) {
          return const Center(
            child: Text('There was an error!'),
          );
        }

        if (state is OrderSuccessState) {
          if (state.orders.isEmpty) {
            return const Center(child: Text('No orders found!'));
          }
          return _buildOrderList();
        }

        if (state is OrderLoadingState) {
          return _buildLoadingWidget();
        }

        return const Center(child: Text('Something went wrong!'));
      },
    );
  }

  ListView _buildOrderList() {
    return ListView.separated(
      itemBuilder: (context, index) => const OrderCard(),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSizes.spaceBtwItems),
      itemCount: 6,
    );
  }

  Widget _buildLoadingWidget() {
    return ListView.separated(
      itemBuilder: (context, index) => const Skeletonizer(child: OrderCard()),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSizes.spaceBtwItems),
      itemCount: 6,
    );
  }
}
