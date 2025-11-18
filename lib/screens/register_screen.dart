import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 290,
            child: SvgPicture.asset(
              'assets/images/registration_page/bubble 01.svg',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            bottom: 540,
            right: 165,
            child: SvgPicture.asset(
              'assets/images/registration_page/bubble 02.svg',
              width: 250,
              height: 250,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30.0, top: 80.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create\nAccount',
                        style: AppTextStyles.heading1,
                      ),
                    ),
                  ),
                  SizedBox(height: 130),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Container(
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
                        SizedBox(height: 15),
                        Container(
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
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.greyLight,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              hintText: 'Your number',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 50,
                                bottom: 0,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            initialCountryCode: 'RU',
                            showDropdownIcon: false,
                            flagsButtonPadding: EdgeInsets.only(
                              left: 20,
                              top: 14.5,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (phone) => print(phone.completeNumber),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 60.0,
                      left: 30.0,
                      right: 30.0,
                      bottom: 30,
                    ),
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
                          // Переход в LoginScreen с плавным растворением
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      LoginScreen(),
                              transitionsBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                              transitionDuration: Duration(milliseconds: 700),
                            ),
                          );
                        },
                        child: Text('Done', style: AppTextStyles.button),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
