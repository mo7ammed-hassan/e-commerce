import 'package:dartz/dartz.dart';

abstract class CategoryRepositoy {
  Future<Either> fetchAllCategories();
}
