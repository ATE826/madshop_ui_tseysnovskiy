import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'register_screen.dart';
import 'password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            top: 100,
            left: 310,
            child: SvgPicture.asset(
              'assets/images/login_password_page/bubblle_03.svg',
              width: 250,
              height: 250,
            ),
          ),
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
              padding: EdgeInsets.only(top: 340),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // заголовок слева
                children: [
                  // Заголовок и подзаголовок
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // текст слева
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 55,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Good to see you back!',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 35),

                  // Поле Email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

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
                              builder: (context) => PasswordScreen(),
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

                  SizedBox(height: 20),

                  // Cancel по центру
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
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
                  ),

                  SizedBox(height: 75),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
