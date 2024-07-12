import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/favorites_controller.dart';
import 'package:mini_shop_cubit/cubit/states/favorites_state.dart';
import 'package:mini_shop_cubit/cubit/products_controller.dart';
import 'package:mini_shop_cubit/models/product.dart';
import 'package:mini_shop_cubit/views/detail_screen.dart';

class ProductItem extends StatefulWidget {
  bool isAdmin;
  final Product product;
  ProductItem({
    super.key,
    this.isAdmin = false,
    required this.product,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isLoading = false;

  void onTapFavorite() async {
    setState(() {
      isLoading = true;
    });

    await BlocProvider.of<FavoritesController>(context)
        .addFavorites(widget.product);

    if (!mounted) return; // State o'chirilganligini tekshirish

    await BlocProvider.of<ProductController>(context)
        .toggleFavorite(widget.product.id);

    if (!mounted) return; // State o'chirilganligini tekshirish

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesController, FavoritesState>(
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => DetailsScreen(
                  isAdmin: widget.isAdmin,
                  product: widget.product,
                ),
              ),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                height: 220,
              ),
              Positioned(
                top: -40,
                left: 20,
                child: SizedBox(
                  height: 130,
                  width: 90,
                  child: widget.product.image != null
                      ? Image.file(
                          widget.product.image!,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              Positioned(
                right: 15,
                top: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      "${widget.product.rating}",
                      style: const TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        widget.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(widget.product.name),
                    const SizedBox(height: 5),
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 15,
                bottom: 10,
                child: isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : IconButton(
                        onPressed: onTapFavorite,
                        icon: Icon(
                          CupertinoIcons.heart_circle_fill,
                          size: 35,
                          color: widget.product.isFavorite
                              ? Colors.red[800]
                              : Colors.grey[500],
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
