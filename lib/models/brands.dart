import 'package:flutter/material.dart';

class Brands{
  final String imgUrl;

  Brands({@required this.imgUrl});
}

List <Brands> brands = [
  Brands(imgUrl: "assets/images/brand1.jpg"),
  Brands(imgUrl: "assets/images/brand2.jpeg"),
  Brands(imgUrl: "assets/images/brand3.jpg"),
  Brands(imgUrl: "assets/images/brand4.jpg"),
  Brands(imgUrl: "assets/images/brand5.png"),
];