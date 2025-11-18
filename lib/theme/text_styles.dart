import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  // Заголовки
  static const TextStyle heading1 = TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w700,
    fontFamily: 'Raleway',
    color: AppColors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'Raleway',
    color: AppColors.black,
  );

  // Подзаголовки
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    color: AppColors.greyText,
  );

  // Кнопки
  static const TextStyle button = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    fontFamily: 'Nunito Sans',
    color: Colors.white,
  );

  // Текст мелкий
  static const TextStyle small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    color: AppColors.greyText,
  );

  // Текст товара
  static const TextStyle productName = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productColorSize = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productPrice = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
