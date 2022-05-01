import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class Expenses {
  String img;
  String text;
  String date;
  String ammount;

  Expenses({
    required this.img,
    required this.text,
    required this.date,
    required this.ammount,
  });
}

List<Expenses> expenses = <Expenses>[
  //First Month
  Expenses(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      date: "2022-03-16T10:31:12.000Z",
      ammount: "2,000"),
  Expenses(
      img: ImagePath.cable1,
      text: "Cable",
      date: "2022-03-16T10:31:12.000Z",
      ammount: "150"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-03-16T10:31:12.000Z",
      ammount: "20"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-03-16T10:31:12.000Z",
      ammount: "25"),
  Expenses(
      img: ImagePath.avatars1,
      text: "James Douglas",
      date: "2022-03-16T10:31:12.000Z",
      ammount: "130"),
      //Second Month
  Expenses(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      date: "2022-02-16T10:31:12.000Z",
      ammount: "2000"),
  Expenses(
      img: ImagePath.avatars2,
      text: "Angela James",
      date: "2022-02-16T10:31:12.000Z",
      ammount: "130"),
  Expenses(
      img: ImagePath.cable1,
      text: "Cable",
      date: "2022-02-16T10:31:12.000Z",
      ammount: "150"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-02-16T10:31:12.000Z",
      ammount: "20"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-02-16T10:31:12.000Z",
      ammount: "25"),
  //Third Month
  Expenses(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      date: "2022-01-16T10:31:12.000Z",
      ammount: "2,000"),
  Expenses(
      img: ImagePath.cable1,
      text: "Cable",
      date: "2022-01-16T10:31:12.000Z",
      ammount: "150"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-01-16T10:31:12.000Z",
      ammount: "20"),
  Expenses(
      img: ImagePath.food1,
      text: "Food",
      date: "2022-01-16T10:31:12.000Z",
      ammount: "25"),
  Expenses(
      img: ImagePath.avatars1,
      text: "James Douglas",
      date: "2022-01-16T10:31:12.000Z",
      ammount: "130"),
];
