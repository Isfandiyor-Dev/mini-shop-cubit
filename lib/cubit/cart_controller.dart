import 'package:bloc/bloc.dart';
import 'package:mini_shop_cubit/cubit/states/cart_state.dart';
import 'package:mini_shop_cubit/models/cart.dart';
import 'package:mini_shop_cubit/models/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCartState());

  final Cart _cart = Cart(
    products: {},
    totalPrice: 0,
  );

  Cart get cart {
    return _cart;
  }

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]!["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    emit(LoadedCartState(_cart.products.values.toList()));
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]!["amount"] == 1) {
        _cart.products.removeWhere((key, value) {
          return key == productId;
        });
      } else {
        _cart.products[productId]!["amount"]--;
      }
      calculateTotal();
      emit(LoadedCartState(_cart.products.values.toList()));
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]!['amount'];
  }

  num getAllProdcutsAmount() {
    num amount = 0;
    _cart.products.forEach((key, value) {
      amount += value['amount'];
    });
    return amount;
  }

  void clearCart() {
    _cart.products.clear();
    _cart.totalPrice = 0;
    emit(LoadedCartState(_cart.products.values.toList()));
  }
}
