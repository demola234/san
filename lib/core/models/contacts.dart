import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class SendMoney {
  String img;
  String text;

  SendMoney({
    required this.img,
    required this.text,
  });
}

List<SendMoney> sendmoney = <SendMoney>[
  SendMoney(img: ImagePath.avatars1, text: "Victor"),
  SendMoney(img: ImagePath.avatars2, text: "Peter"),
  SendMoney(img: ImagePath.avatars3, text: "James"),
  SendMoney(img: ImagePath.avatars4, text: "Mark"),
  SendMoney(img: ImagePath.avatars5, text: "James"),
  SendMoney(img: ImagePath.avatars6, text: "Mark"),
  SendMoney(img: ImagePath.avatars3, text: "James"),
  SendMoney(img: ImagePath.avatars4, text: "Mark"),
];
