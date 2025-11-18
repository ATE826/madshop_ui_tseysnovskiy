import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'register_screen.dart';
import 'password_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
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

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 340),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: AppTextStyles.heading1),
                        SizedBox(height: 5),
                        Text(
                          'Good to see you back!',
                          style: AppTextStyles.subtitle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
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
                              builder: (context) => PasswordScreen(),
                            ),
                          );
                        },
                        child: Text('Done', style: AppTextStyles.button),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                      child: Text('Cancel', style: AppTextStyles.small),
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
