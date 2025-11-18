import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'favorites_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, String>> products = [
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'color_size': 'Pink, Size M',
      'price': '\$17,00',
      'image': 'assets/images/cards/7.jpg',
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'color_size': 'Pink, Size M',
      'price': '\$17,00',
      'image': 'assets/images/cards/8.jpg',
    },
  ];

  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    quantities = List.filled(products.length, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Text('Cart', style: AppTextStyles.heading2),
            SizedBox(width: 8),
            // Кружок с цифрой
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.productNumber, // фон кружка
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '2',
                style: AppTextStyles.productPrice.copyWith(
                  fontSize: 14, // подгоняем размер под кружок
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Изображение с тенью
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(product['image']!, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Информация о товаре
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product['name']!,
                          style: AppTextStyles.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['color_size']!,
                          style: AppTextStyles.productColorSize,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Цена
                            Text(
                              product['price']!,
                              style: AppTextStyles.productPrice,
                            ),
                            // Количество с кнопками
                            Row(
                              children: [
                                // Кнопка минус
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantities[index] > 1)
                                        quantities[index]--;
                                    });
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: AppColors
                                          .background, // фон внутри круга
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            AppColors.primary, // цвет границы
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                // Количество
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.productNumber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    quantities[index].toString(),
                                    style: AppTextStyles.productPrice,
                                  ),
                                ),
                                SizedBox(width: 8),
                                // Кнопка плюс
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantities[index]++;
                                    });
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: AppColors
                                          .background, // фон внутри круга
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            AppColors.primary, // цвет границы
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Итоговая стоимость с кнопкой
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            color: AppColors.greyLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total текст и цена с разной жирностью
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total: ',
                        style: AppTextStyles.productPrice.copyWith(
                          fontSize: 24, // больше
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text: '\$34,00',
                        style: AppTextStyles.productPrice.copyWith(
                          fontSize: 20, // чуть меньше
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // Кнопка Checkout
                ElevatedButton(
                  onPressed: () {
                    // Тут можно добавить логику перехода
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    'Checkout',
                    style: AppTextStyles.button.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Сам BottomNavigationBar
          BottomNavigationBar(
            currentIndex: 2,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  child: Icon(Icons.shopping_bag_outlined),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.black, width: 3),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
