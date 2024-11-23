abstract class UseCases<Type, Parmas> {
  Future<Type> call({Parmas params});
}