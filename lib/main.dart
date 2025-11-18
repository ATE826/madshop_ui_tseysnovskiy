import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Страницы приложения
import 'screens/cart_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/login_screen.dart';
import 'screens/password_screen.dart';
import 'screens/product_screen.dart';
import 'screens/register_screen.dart';
import 'screens/start_screen.dart';

// Стили и темы
import 'theme/colors.dart';
import 'theme/text_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Полноэкранный режим
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAD Shop',

      // theme: ThemeData(
      //   primaryColor: AppColors.primary,
      //   textTheme: TextTheme(
      //     headline1: AppTextStyles.headline,
      //     bodyText1: AppTextStyles.body,
      //   ),
      // ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => StartScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/password': (context) => PasswordScreen(),
        '/product': (context) => ProductScreen(),
        '/cart': (context) => CartScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}
