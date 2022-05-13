import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class Operators {
  String img;
  String text;
  String time;
  String amount;

  Operators(
      {required this.img,
      required this.text,
      required this.time,
      required this.amount});
}

List<Operators> operators = <Operators>[
  //First Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-03-16T12:41:12.000Z",
      amount: "2,000"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-03-16T20:31:12.000Z",
      amount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-03-16T06:31:12.000Z",
      amount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-03-16T09:31:12.000Z",
      amount: "25"),
  Operators(
      img: ImagePath.avatars1,
      text: "James Douglas",
      time: "2022-03-16T14:12:12.000Z",
      amount: "130"),
  //Second Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-02-16T15:24:12.000Z",
      amount: "2000"),
  Operators(
      img: ImagePath.avatars2,
      text: "Angela James",
      time: "2022-02-16T17:34:12.000Z",
      amount: "130"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-02-16T19:30:12.000Z",
      amount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-02-16T15:31:12.000Z",
      amount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-02-16T13:24:12.000Z",
      amount: "25"),
  //Third Month
  Operators(
      img: ImagePath.lccc,
      text: "Special love child care LLC",
      time: "2022-01-16T10:13:12.000Z",
      amount: "2,000"),
  Operators(
      img: ImagePath.cable1,
      text: "Cable",
      time: "2022-01-16T10:31:12.000Z",
      amount: "150"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-01-16T13:15:12.000Z",
      amount: "20"),
  Operators(
      img: ImagePath.food1,
      text: "Food",
      time: "2022-01-16T09:52:12.000Z",
      amount: "25"),
  Operators(
      img: ImagePath.avatars1,
      text: "James Douglas",
      time: "2022-01-16T19:01:12.000Z",
      amount: "130"),
];
