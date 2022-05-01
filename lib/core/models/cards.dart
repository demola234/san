import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class CardsDetails {
  String card;
  String cardtype;
  String ammount;
  String lastno;
  Color color;

  CardsDetails({
    required this.card,
    required this.cardtype,
    required this.ammount,
    required this.lastno,
    required this.color,
  });
}

List<CardsDetails> cardDetails = <CardsDetails>[
  CardsDetails(
    card: ImagePath.mastercard,
    cardtype: "Gold card",
    ammount: "3221.34",
    lastno: "2122",
    color: Colors.red,
  ),
  CardsDetails(
    card: ImagePath.visacsard,
    cardtype: "Silver card",
    ammount: "3221.34",
    lastno: "1992",
    color: Color(0xFFF9EFDA),
  ),
  CardsDetails(
    card: ImagePath.visacsard,
    cardtype: "Regular card",
    ammount: "3412.34",
    lastno: "1872",
    color: Colors.blue,
  ),
  CardsDetails(
    card: ImagePath.mastercard,
    cardtype: "Gold card",
    ammount: "3221.34",
    lastno: "2122",
    color: Colors.red,
  ),
];