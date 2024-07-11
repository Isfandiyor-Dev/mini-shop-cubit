import 'package:mini_shop_cubit/models/product.dart';

sealed class FavoritesState {}

final class InitialFavoritesState extends FavoritesState {}

final class LoadingFavoritesState extends FavoritesState {}

final class LoadedFavoritesState extends FavoritesState {
  List<Product> favoriteProducts = [];

  LoadedFavoritesState(this.favoriteProducts);
}

final class ErrorFavoritesState extends FavoritesState {
  String message;

  ErrorFavoritesState(this.message);
}
