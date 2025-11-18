import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'product_screen.dart';
import 'login_screen.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          true, // автоматически сжимает контент при клавиатуре
      body: Stack(
        children: [
          // ------------------ SVG на заднем фоне ------------------
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/login_password_page/bubble_02.svg',
              width: 320,
              height: 320,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/login_password_page/bubble_01.svg',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: 450,
            left: 200,
            child: SvgPicture.asset(
              'assets/images/login_password_page/bubble_04.svg',
              width: 350,
              height: 350,
            ),
          ),

          // ------------------ Основной контент с прокруткой ------------------
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Заголовок
                  Column(
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Type your password',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 105),

                  // Поле пароля
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 70),

                  // Кнопка Done
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 61,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 76, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Nunito Sans',
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Cancel
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),

                  SizedBox(height: 75), // нижний отступ
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
