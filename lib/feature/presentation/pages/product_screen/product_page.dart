import 'package:flutter/material.dart';
import 'package:pos_app/feature/presentation/pages/product_screen/product_item.dart';


class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      title: 'Burger',
      price: 9.99,
    ),
    Product(
      imageUrl:
          'https://media.istockphoto.com/id/509568543/photo/indian-food.webp?b=1&s=170667a&w=0&k=20&c=6pyfySYOr4X2T1_zZ-XRa9wY15_1rVlfIDimXMPVVUE=',
      title: 'Biryani',
      price: 19.99,
    ),
    // Add more products as needed
  ];
  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String title;
  final double price;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}
