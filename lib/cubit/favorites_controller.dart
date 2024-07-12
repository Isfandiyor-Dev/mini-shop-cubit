import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/states/favorites_state.dart';
import 'package:mini_shop_cubit/models/product.dart';

class FavoritesController extends Cubit<FavoritesState> {
  FavoritesController() : super(InitialFavoritesState());

  final List<Product> favorites = [];

  Future<void> addFavorites(Product product) async {
    try {
      emit(LoadingFavoritesState());
      await Future.delayed(const Duration(seconds: 1));
      bool isInFavorite = false;

      // `List`ning nusxasini yaratamiz va shunda iteratsiya paytida o'zgartirishlar kiritamiz
      final copyFavorites = List<Product>.from(favorites);
      for (var element in copyFavorites) {
        if (element.id == product.id) {
          isInFavorite = true;
          favorites.remove(element);
        }
      }

      if (!isInFavorite) {
        favorites.add(product);
      }
      emit(LoadedFavoritesState(favorites));
    } catch (e) {
      print("Xatolik sodir bo'ldi $e");
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
      print("Xatolik sodir bo'ldi $e");
      emit(ErrorFavoritesState("Sevimli mahsulotlarni olib tashlay olmadim"));
    }
  }

  Future<void> getFavorites() async {
    try {
      emit(LoadingFavoritesState());
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadedFavoritesState(favorites));
    } catch (e) {
      print("Xatolik sodir bo'ldi $e");
      emit(ErrorFavoritesState("Sevimli mahsulotlarni ololmadim"));
    }
  }
}
