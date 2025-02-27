// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentMethodModel {
  final String name;
  final String image;
  const PaymentMethodModel({
    required this.name,
    required this.image,
  });

  static PaymentMethodModel empty() {
    return const PaymentMethodModel(name: '', image: '');
  }
}
