import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const CartScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        height: MediaQuery.of(context).size.height * 0.4, // Limit image height
        fit: BoxFit.contain,
      ),
      const SizedBox(height: 16),
      Text(
        name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      const SizedBox(height: 8),
      Text(
        price,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    ],
  ),
)

    );
  }
}

