import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class DetailedExpenditure {
  String expenditure;
  String ammount;
  Color color;
  String icon;

  DetailedExpenditure({
    required this.expenditure,
    required this.ammount,
    required this.color,
    required this.icon,
  });
}

List<DetailedExpenditure> detailedExpenditure = <DetailedExpenditure>[
  DetailedExpenditure(
    expenditure: "Child Care",
    ammount: "2000.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.child,
  ),
  DetailedExpenditure(
    expenditure: "Food",
    ammount: "20.99",
    color: Color(0xFFD2D7D1),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Cable",
    ammount: "150.00",
    color: Color(0xFFEBECE9),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Food",
    ammount: "20.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Child Care",
    ammount: "2000.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.child,
  ),
  DetailedExpenditure(
    expenditure: "Cable",
    ammount: "150.00",
    color: Color(0xFFEBECE9),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Food",
    ammount: "20.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Food",
    ammount: "20.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.food,
  ),
  DetailedExpenditure(
    expenditure: "Child Care",
    ammount: "2000.23",
    color: Color(0xFFF9EFDA),
    icon: ImagePath.child,
  ),
  DetailedExpenditure(
    expenditure: "Cable",
    ammount: "150.00",
    color: Color(0xFFEBECE9),
    icon: ImagePath.food,
  ),
];
