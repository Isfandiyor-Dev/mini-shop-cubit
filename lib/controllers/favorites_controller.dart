import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/controllers/favorites_state.dart';
import 'package:mini_shop_cubit/models/product.dart';

class FavoritesController extends Cubit<FavoritesState> {
  FavoritesController() : super(InitialFavoritesState());

  final List<Product> favorites = [];

  Future<void> addFavorites(Product product) async {
    try {
      emit(LoadingFavoritesState());
      await Future.delayed(const Duration(seconds: 1));
      bool isInFavorite = false;
      for (var element in favorites) {
        if (element.id == product.id) {
          isInFavorite = true;
          favorites.remove(element);
        }
      }
      if(!isInFavorite){
        favorites.add(product);
      }
      emit(LoadedFavoritesState(favorites));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorFavoritesState("Sevimli mahsulotlarni qo'sha olmadim"));
    }
  }

  Future<void> removeFavorite(Product product) async {
    try {
      emit(LoadingFavoritesState());
      await Future.delayed(const Duration(seconds: 1));

      favorites.remove(product);
      emit(LoadedFavoritesState(favorites));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorFavoritesState("Sevimli mahsulotlarni olib tashlay olmadim"));
    }
  }

  Future<void> getFavorites() async {
    try {
      emit(LoadingFavoritesState());
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadedFavoritesState(favorites));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorFavoritesState("Sevimli mahsulotlarni ololmadim"));
    }
  }
}
