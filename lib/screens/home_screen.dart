import 'package:flutter/material.dart';
import 'product_screen.dart'; // экран товара
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class HomeScreen extends StatelessWidget {
  // Пример данных для карточек товаров
  final List<Map<String, String>> products = [
    {
      'name': 'Красная футболка',
      'price': '1200 ₽',
      'image': 'assets/images/product1.png',
    },
    {
      'name': 'Синяя куртка',
      'price': '3500 ₽',
      'image': 'assets/images/product2.png',
    },
    {
      'name': 'Кроссовки',
      'price': '4200 ₽',
      'image': 'assets/images/product3.png',
    },
    {'name': 'Шорты', 'price': '800 ₽', 'image': 'assets/images/product4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MAD Shopp', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 карточки в ряд
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7, // чтобы карточки были выше, чем шире
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // Переход на экран товара
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ProductScreen(
                //       name: product['name']!,
                //       price: product['price']!,
                //       image: product['image']!,
                //     ),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Image.asset(
                      product['image']!,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 8),
                    Text(
                      product['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      product['price']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
