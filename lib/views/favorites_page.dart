import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/favorites_controller.dart';
import 'package:mini_shop_cubit/cubit/states/favorites_state.dart';
import 'package:mini_shop_cubit/models/product.dart';
import 'package:mini_shop_cubit/views/widgets/product_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<FavoritesController>().getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
      ),
      body: BlocBuilder<FavoritesController, FavoritesState>(
        builder: (context, state) {
          if (state is InitialFavoritesState) {
            return const Center(
                child: Center(
              child: Text("Malumot yuklanmoqda"),
            ));
          }
          if (state is LoadingFavoritesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorFavoritesState) {
            return Center(
              child: Text("Error: ${state.message}"),
            );
          }
          var products = (state as LoadedFavoritesState).favoriteProducts;

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Have favorites ${products.length} products",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 90,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return ProductItem(
                      product: product,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
