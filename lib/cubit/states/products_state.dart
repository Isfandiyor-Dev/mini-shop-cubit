//! InitialState - boshlang'ich holat
//! LoadingState - yuklanish holati
//! LoadedState - yuklanib bo'lgan holati
//! ErrorState - xatolik holati

import 'package:mini_shop_cubit/models/product.dart';

sealed class ProductsState {}

final class InitialState extends ProductsState {}

final class LoadingState extends ProductsState {}

final class LoadedState extends ProductsState {
  List<Product> products = [];

  LoadedState(this.products);
}

final class ErrorState extends ProductsState {
  String message;

  ErrorState(this.message);
}
