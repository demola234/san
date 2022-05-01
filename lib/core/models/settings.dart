import 'package:flutter/material.dart';
import 'package:santander/utils/image_path.dart';

class Settings {
  String img;
  String text;

  Settings({
    required this.img,
    required this.text,
  });
}

List<Settings> settings = <Settings>[
  Settings(img: ImagePath.notifications, text: "Notification"),
  Settings(img: ImagePath.lock, text: "Security"),
  Settings(img: ImagePath.device, text: "Devices"),
  Settings(img: ImagePath.login, text: "Login options"),
  Settings(img: ImagePath.visibility, text: "Quick overview"),
  Settings(img: ImagePath.dollar, text: "Currencies"),
  Settings(img: ImagePath.info, text: "Information"),
];
