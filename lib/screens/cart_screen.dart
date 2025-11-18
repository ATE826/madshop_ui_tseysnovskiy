import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'product_screen.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/1.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/2.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/3.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/4.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/5.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': '\$17,00',
      'image': 'assets/images/cards/6.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      // Оборачиваем body в GestureDetector, чтобы ловить клики вне поля
      body: GestureDetector(
        onTap: () {
          // Снимаем фокус с TextField, клавиатура закрывается
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product['image']!,
                                  width: 155,
                                ),
                              ),
                            ),

                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 4.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                product['price']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // текущая вкладка — Cart
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoritesScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black, // выбранная иконка чёрная
        unselectedItemColor: Color.fromARGB(
          255,
          0,
          76,
          255,
        ), // остальные иконки синие
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.shopping_bag_outlined),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black, // подчёркивание только для выбранной
                    width: 3,
                  ),
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
