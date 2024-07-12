import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/themes/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ThemeCubit, Brightness>(
        builder: (context, theme) {
          return SwitchListTile(
            title: const Text('Dark Mode'),
            value: theme == Brightness.dark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleMode();
            },
          );
        },
      ),
    );
  }
}
