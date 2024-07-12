import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_shop_cubit/cubit/products_controller.dart';
import 'package:mini_shop_cubit/models/product.dart';
import 'package:mini_shop_cubit/views/widgets/mu_text_field.dart';

// ignore: must_be_immutable
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? image;

  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final titleController = TextEditingController();

  Future<void> _pickImage(ImageSource source, int imageIndex) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  // var productsController = ProductsController();

  void addProductBtn() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      BlocProvider.of<ProductController>(context)
          .addProduct(
        Product(
          id: UniqueKey().toString(),
          name: nameController.text,
          title: titleController.text,
          description: descriptionController.text,
          rating: num.parse(ratingController.text),
          price: num.parse(priceController.text),
          image: image,
        ),
      )
          .then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Text(
                "First Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              _buildImagePicker(1, image),
              const Divider(),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Title",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                textEditingController: titleController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Description",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                textEditingController: descriptionController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Price",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                textEditingController: priceController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Rating",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a rating';
                  }
                  return null;
                },
                textEditingController: ratingController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                ),
                onPressed: addProductBtn,
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(int index, File? imageFile) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: imageFile != null
              ? Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                )
              : null,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary,
                ),
              ),
              onPressed: () => _pickImage(ImageSource.camera, index),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Camera"),
            ),
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary,
                ),
              ),
              onPressed: () => _pickImage(ImageSource.gallery, index),
              icon: const Icon(Icons.photo),
              label: const Text("Camera"),
            ),
          ],
        ),
      ],
    );
  }
}
