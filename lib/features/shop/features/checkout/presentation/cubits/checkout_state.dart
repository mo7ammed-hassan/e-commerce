abstract class CheckoutState{}

class CheckoutInitial extends CheckoutState{}

class ChangePaymentMethodState extends CheckoutState{}

class CheckoutSuccessState extends CheckoutState{
}

class CheckoutErrorState extends CheckoutState{}

class CheckoutLoadingState extends CheckoutState{}