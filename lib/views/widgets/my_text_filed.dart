import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final String? Function(String?) validation;
  final String hintText;
  final bool haveObscureText;
  const MyTextFiled({
    super.key,
    required this.textController,
    required this.validation,
    required this.hintText,
    this.keyboardType,
    this.haveObscureText = false,
  });

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        validator: widget.validation,
        obscureText: widget.haveObscureText ? obscureText : false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          suffixIcon: widget.haveObscureText
              ? IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  icon: obscureText
                      ? const Icon(CupertinoIcons.eye_slash_fill)
                      : const Icon(CupertinoIcons.eye_fill),
                )
              : null,
          
        ),
      ),
    );
  }
}
