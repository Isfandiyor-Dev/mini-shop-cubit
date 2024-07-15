import 'package:mini_shop_cubit/models/product.dart';

sealed class CartState {}

final class InitialCartState extends CartState {}

final class LoadingCartState extends CartState {}

final class LoadedCartState extends CartState {
  List<dynamic> cartProducts = [];

  LoadedCartState(this.cartProducts);
}

final class ErrorCartState extends CartState {
  String message;

  ErrorCartState(this.message);
}
