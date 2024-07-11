import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String? imagePath;
  const MySquareTile({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]),
        child: imagePath != null
            ? Image.asset(
                imagePath!,
                height: 40,
              )
            : null,
      ),
    );
  }
}
