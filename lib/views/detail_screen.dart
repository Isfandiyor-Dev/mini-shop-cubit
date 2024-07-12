import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mini_shop_cubit/controllers/products_controller.dart';
import 'package:mini_shop_cubit/models/product.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  bool isAdmin;
  Product product;
  DetailsScreen({super.key, this.isAdmin = false, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Color> colors = [
    Colors.orange,
    Colors.blueGrey,
    Colors.black,
  ];

  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    // var cartController = context.read<ProductController>().products;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: widget.isAdmin
          ? null
          : IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart_circle_fill,
                size: 50,
                color: Colors.lightGreen.withOpacity(0.4),
              ),
            ),
      bottomNavigationBar: widget.isAdmin
          ? null
          : Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                bottom: 18,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        // cartController.addToCart(widget.product);
                      },
                      child: Ink(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightGreen,
                        ),
                        child: const Center(
                          child: Text("Add To Cart"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      backgroundColor: Colors.lightGreen,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag,
                    ),
                  )
                ],
              ),
            ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.lightGreen,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  height: 300,
                  child: widget.product.image != null
                      ? Image.file(
                          widget.product.image!,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(widget.product.name),
                    SizedBox(
                      width: 160,
                      child: Text(
                        widget.product.title,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Price"),
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightGreen,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Choose Colors"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: colors.length * 50,
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    setState(() {
                                      currentColor = index;
                                    });
                                  },
                                  child: Ink(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: currentColor == index
                                          ? const Icon(
                                              CupertinoIcons.checkmark_alt,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) {
                        return Icon(
                          Icons.star_rate_rounded,
                          color: index <= widget.product.rating - 1
                              ? Colors.amber
                              : Colors.grey[600],
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${widget.product.rating}",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text("124 reviews"),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                )
              ],
            ),
            const Text(
              "About Products",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 3,
              ),
            ),
            Text(widget.product.description),
          ],
        ),
      ),
    );
  }
}
