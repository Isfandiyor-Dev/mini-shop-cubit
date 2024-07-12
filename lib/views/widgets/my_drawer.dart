import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop_cubit/views/favorites_page.dart';
import 'package:mini_shop_cubit/views/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const FavoritesPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Category'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to Category screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const SettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.square_arrow_right,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to more items
            },
          ),
        ],
      ),
    );
  }
}
