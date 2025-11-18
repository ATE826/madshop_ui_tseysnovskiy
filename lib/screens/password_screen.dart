import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'product_screen.dart';
import 'login_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
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

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Hello!', style: AppTextStyles.heading2),
                      SizedBox(height: 20),
                      Text('Type your password', style: AppTextStyles.subtitle),
                    ],
                  ),
                  SizedBox(height: 105),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
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
                              color: AppColors.greyText,
                            ),
                            onPressed: () {
                              setState(
                                () => _isPasswordVisible = !_isPasswordVisible,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 61,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
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
                        child: Text('Done', style: AppTextStyles.button),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Cancel', style: AppTextStyles.small),
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
