import 'package:bloc/bloc.dart';
import 'package:mini_shop_cubit/cubit/states/orders_state.dart';
import 'package:mini_shop_cubit/models/cart.dart';

class OrderController extends Cubit<OrdersState> {
  final List<Order> orders = [];

  OrderController() : super(InitialOrderState());

  Future<void> getOrders() async {
    try {
      emit(LoadingOrderState());
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadedOrderState(orders));
    } catch (e) {
      emit(ErrorOrderState("Failed to fetch orders"));
    }
  }

  Future<void> addOrder(Cart cart) async {
    try {
      emit(LoadingOrderState());
      await Future.delayed(const Duration(seconds: 1));
      orders.add(Order(
        products: cart.products,
        totalPrice: cart.totalPrice,
        date: DateTime.now(),
      ));
      emit(LoadedOrderState(orders));
    } catch (e) {
      emit(ErrorOrderState("Failed to add order"));
    }
  }
}
