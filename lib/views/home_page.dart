import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/products_controller.dart';
import 'package:mini_shop_cubit/cubit/states/products_state.dart';
import 'package:mini_shop_cubit/models/product.dart';
import 'package:mini_shop_cubit/views/admin/add_product.dart';
import 'package:mini_shop_cubit/views/widgets/my_drawer.dart';
import 'package:mini_shop_cubit/views/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ProductController>().getProdcuts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // var controller = BlocProvider.of<ProductController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MyDrawer(),
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          fixedSize: const Size(50, 50),
          backgroundColor: Colors.lightGreen,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const AddProductScreen()));
        },
        icon: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.lightGreen.shade500,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.lightGreen.shade500,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.lightGreen.shade500,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/myphoto.png"),
              radius: 25,
            ),
          )
        ],
      ),
      body: BlocBuilder<ProductController, ProductsState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
                child: Center(
              child: Text("Malumot yuklanmoqda"),
            ));
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text("Error: ${state.message}"),
            );
          }
          var products = (state as LoadedState).products;

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Have ${products.length} products",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            "Sort by",
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                          ),
                        ],
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
