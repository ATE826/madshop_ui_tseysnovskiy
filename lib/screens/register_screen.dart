import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false; // состояние видимости пароля

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ------------------ SVG на заднем фоне ------------------
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

          // ------------------ Основной контент ------------------
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Заголовок
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30.0, top: 80.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create\nAccount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 130),

                  // Основная форма
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        // Email
                        Container(
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
                        SizedBox(height: 15),

                        // Password
                        Container(
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
                        SizedBox(height: 15),

                        // Phone number
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 248, 248),
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
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Кнопка Done
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
                          backgroundColor: Color.fromARGB(255, 0, 76, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
