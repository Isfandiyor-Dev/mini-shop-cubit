import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/favorites_controller.dart';
import 'package:mini_shop_cubit/cubit/products_controller.dart';
import 'package:mini_shop_cubit/themes/theme_cubit.dart';
import 'package:mini_shop_cubit/views/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => ProductController()),
        BlocProvider(create: (ctx) => FavoritesController()),
        BlocProvider(create: (ctx) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, Brightness>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: theme,
              colorSchemeSeed: Colors.lightGreen,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
