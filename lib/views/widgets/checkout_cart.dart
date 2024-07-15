import 'package:flutter/material.dart';
import 'package:mini_shop_cubit/models/cart.dart';

class MyCheckountDialog extends StatefulWidget {
  final Cart cart;
  const MyCheckountDialog({super.key, required this.cart});

  @override
  State<MyCheckountDialog> createState() => _MyCheckountDialogState();
}

class _MyCheckountDialogState extends State<MyCheckountDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      icon: const Icon(
        Icons.check_circle_rounded,
        size: 65,
      ),
      iconColor: const Color(0xff8687E7),
      title: const Text("Added to orders"),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      content: const Text(
        "The order was successfully placed! Thank you for purchasing our products!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w500,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xff8687E7)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Got it",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              letterSpacing: 0.8,
              color: Color.fromARGB(255, 167, 169, 249),
            ),
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xff8687E7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text(
            "View orders",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
              height: 1.5,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
