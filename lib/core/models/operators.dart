import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class Operators {
  String img;
  String text;
  String time;
  String ammount;

  Operators(
      {required this.img,
      required this.text,
      required this.time,
      required this.ammount});
}

List<Operators> operators = <Operators>[
  //First Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-03-16T10:31:12.000Z",
      ammount: "2,000"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-03-16T10:31:12.000Z",
      ammount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-03-16T10:31:12.000Z",
      ammount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-03-16T10:31:12.000Z",
      ammount: "25"),
  Operators(
      img: ImagePath.avatars1,
      text: "James Douglas",
      time: "2022-03-16T10:31:12.000Z",
      ammount: "130"),
      //Second Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-02-16T10:31:12.000Z",
      ammount: "2000"),
  Operators(
      img: ImagePath.avatars2,
      text: "Angela James",
      time: "2022-02-16T10:31:12.000Z",
      ammount: "130"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-02-16T10:31:12.000Z",
      ammount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-02-16T10:31:12.000Z",
      ammount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-02-16T10:31:12.000Z",
      ammount: "25"),
  //Third Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-01-16T10:31:12.000Z",
      ammount: "2,000"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-01-16T10:31:12.000Z",
      ammount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-01-16T10:31:12.000Z",
      ammount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-01-16T10:31:12.000Z",
      ammount: "25"),
  Operators(
      img: ImagePath.avatars1,
      text: "James Douglas",
      time: "2022-01-16T10:31:12.000Z",
      ammount: "130"),
];
