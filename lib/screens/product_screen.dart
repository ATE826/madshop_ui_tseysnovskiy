import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<ProductCard> products = [
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/1.jpg',
    ),
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/2.jpg',
    ),
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/3.jpg',
    ),
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/4.jpg',
    ),
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/5.jpg',
    ),
    ProductCard(
      name: 'Lorem ipsum dolor sit amet consectetur',
      price: '\$17,00',
      image: 'assets/images/cards/6.jpg',
    ),
  ];

  List<bool> favorites = [];
  List<bool> inCart = [];

  @override
  void initState() {
    super.initState();
    favorites = List.filled(products.length, false);
    inCart = List.filled(products.length, false);
  }

  @override
  Widget build(BuildContext context) {
    int cartCount = inCart
        .where((item) => item)
        .length; // количество товаров в корзине

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Text('Shop', style: AppTextStyles.heading2),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.searchField,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  style: TextStyle(color: AppColors.primary),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: AppColors.primary),
                    prefixIcon: Icon(Icons.search, color: AppColors.primary),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            // Индикатор корзины
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.productNumber,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                cartCount.toString(),
                style: AppTextStyles.productPrice.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
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
                                child: Image.asset(product.image, width: 155),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    favorites[index] = !favorites[index];
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: favorites[index]
                                        ? AppColors.red
                                        : Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    inCart[index] = !inCart[index];
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: inCart[index]
                                        ? AppColors.black
                                        : AppColors.background,
                                    size: 28,
                                  ),
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
                                product.name,
                                style: AppTextStyles.productName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                product.price,
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
        currentIndex: 0,
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
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.home_outlined),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black, width: 3),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.favorite_outline),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 3),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: Icon(Icons.shopping_bag_outlined),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 3),
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
