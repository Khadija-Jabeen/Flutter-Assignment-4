import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Action for menu icon
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Action for search icon
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Scrollable Cards Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard(
                    '50% Off',
                    'On everything today',
                    'With code: FSCREATION',
                    'assets/images/image-1.jpg',
                  ),
                  const SizedBox(width: 10),
                  buildCard(
                    '70% Off',
                    'On select items',
                    'With code: FSCREATION',
                    'assets/images/image-2.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // New Arrivals Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'New Arrivals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Action for View All
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildProductCard(
                    'The Marc Jacobs',
                    'Traveler Tote',
                    '\$195.00',
                    'assets/images/new-1.jpeg',
                    context,
                  ),
                  const SizedBox(width: 15),
                  buildProductCard(
                    'Axel Arigato',
                    'Clean 90 Triple Sneakers',
                    '\$245.00',
                    'assets/images/new-2.jpg',
                    context,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Popular Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Action for View All
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                buildPopularCard(
                  'Gia Borghini',
                  'RHW Rosie 1 Sandals',
                  '\$740.00',
                  4.5,
                  'assets/images/pop-1.jpg',
                ),
                buildPopularCard(
                  'Nike Air Max',
                  'Classic Running Shoes',
                  '\$120.00',
                  4.7,
                  'assets/images/pop-2.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String subtitle, String code, String imagePath) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              code,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Action for Get Now button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Get Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(
    String name,
    String description,
    String price,
    String imagePath,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              name: name,
              description: description,
              price: price,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 226,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath, width: 226, height: 150, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPopularCard(String name, String description, String price, double rating, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Icon(Icons.star, color: Colors.yellow[600], size: 16),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CartScreen extends StatefulWidget {
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
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top product image carousel
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 300, // Adjust height as per requirement
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    widget.imagePath,
                    fit: BoxFit.fitWidth, // Ensures the image covers full width
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.lock_outline, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Details container
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product details with Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product Name
                      Expanded(
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Quantity Selector
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.black),
                            onPressed: _decreaseQuantity,
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.black),
                            onPressed: _increaseQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  // Review Row with the "Available in stock" text aligned to the right
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 2),
                      const Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      const Text("(270 Reviews)", style: TextStyle(color: Colors.grey)),
                      const Spacer(), // This will push the "Available in stock" to the right
                      const Text(
                        "Available in stock",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Size selection
                  const Text(
                    'Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (var size in ['39', '39.5', '40', '40.5', '41'])
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),  // Reduced gap between chips
                          child: GestureDetector(
                            onTap: () {
                              // Handle the selection logic
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: size == '41' ? Colors.black : Colors.white,
                                shape: BoxShape.circle, // Circular shape for the chip
                                border: Border.all(
                                  color: size == '41' ? Colors.black : Colors.grey, // Border color for selected/deselected
                                  width: 1.5,
                                ),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: size == '41' ? Colors.white : Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Total Price and Add to Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price: \$${double.parse(widget.price.substring(1)) * quantity}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.lock),
                        label: const Text('Add to cart'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
