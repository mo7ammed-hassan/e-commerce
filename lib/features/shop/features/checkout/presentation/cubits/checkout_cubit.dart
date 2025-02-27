import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:t_store/features/shop/features/checkout/data/models/payment_method_model.dart';
import 'package:t_store/features/shop/features/checkout/presentation/cubits/checkout_state.dart';

import 'package:t_store/utils/constants/images_strings.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  PaymentMethodModel selectedPaymentMethod = PaymentMethodModel.empty();

  // change payment method
  void initPaymentMethod() {
    selectedPaymentMethod =
        const PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
  }

  // change payment method
  void changePaymentMethod({required PaymentMethodModel paymentMethod}) {
    selectedPaymentMethod = paymentMethod;
    emit(ChangePaymentMethodState());
  }
}
