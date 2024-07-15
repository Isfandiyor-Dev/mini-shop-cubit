//! InitialState - boshlang'ich holat
//! LoadingState - yuklanish holati
//! LoadedState - yuklanib bo'lgan holati
//! ErrorState - xatolik holati

import 'package:mini_shop_cubit/models/cart.dart';

sealed class OrdersState {}

final class InitialOrderState extends OrdersState {}

final class LoadingOrderState extends OrdersState {}

final class LoadedOrderState extends OrdersState {
  List<Order> products = [];

  LoadedOrderState(this.products);
}

final class ErrorOrderState extends OrdersState {
  String message;

  ErrorOrderState(this.message);
}
