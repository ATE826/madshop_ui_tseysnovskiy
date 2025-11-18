import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'cart_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class FavoritesScreen extends StatelessWidget {
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Favorites', style: AppTextStyles.heading2),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppColors.background,
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
                                  color: AppColors.red,
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
                                style: AppTextStyles.productName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                product['price']!,
                                style: AppTextStyles.productPrice,
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ProductScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => FavoritesScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            );
          }
        },
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.favorite_outline),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black, width: 3),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
