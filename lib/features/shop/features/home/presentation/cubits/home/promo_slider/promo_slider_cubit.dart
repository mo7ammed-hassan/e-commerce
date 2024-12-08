import 'package:flutter_bloc/flutter_bloc.dart';

class PromoSliderCubit extends Cubit<int> {
  PromoSliderCubit() : super(0);

  void updatePageIndicator(int index) => emit(index);
}
