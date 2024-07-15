import 'package:bloc/bloc.dart';
import 'package:mini_shop_cubit/cubit/states/products_state.dart';
import 'package:mini_shop_cubit/models/product.dart';

class ProductController extends Cubit<ProductsState> {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Modern Sofa',
      title: 'Elegant Modern Sofa',
      description:
          'A comfortable and stylish modern sofa that fits perfectly in any living room.',
      rating: 4.5,
      price: 299.99,
      image: null,
    ),
    Product(
        id: '2',
        name: 'Coffee Table',
        title: 'Wooden Coffee Table',
        description: 'A classic wooden coffee table with a modern twist.',
        rating: 4.0,
        price: 149.99,
        image: null),
    Product(
      id: '3',
      name: 'King Size Bed',
      title: 'Luxury King Size Bed',
      description:
          'A luxurious and comfortable king size bed for a good night\'s sleep.',
      rating: 4.8,
      price: 499.99,
      image: null,
    ),
    Product(
      id: '4',
      name: 'Nightstand',
      title: 'Modern Nightstand',
      description: 'A sleek and modern nightstand with ample storage.',
      rating: 4.3,
      price: 79.99,
      image: null,
    ),
  ];

  ProductController() : super(InitialState());

  Future<void> getProducts() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadedState(products));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorState("Rejalarni ololmadim"));
    }
  }

  Future<void> addProduct(product) async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 1));
      products.add(product);
      emit(LoadedState(products));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorState("Rejalarni ololmadim"));
    }
  }

  Future<void> toggleFavorite(String id) async {
    for (var prodcut in products) {
      if (prodcut.id == id) {
        prodcut.isFavorite = !prodcut.isFavorite;
        break;
      }
    }
  }

  Future<void> getFavorites() async {
    final List<Product> favorites = [];
    for (var product in products) {
      if (product.isFavorite) {
        favorites.add(product);
      }
    }

    emit(LoadedState(favorites));
  }
}
