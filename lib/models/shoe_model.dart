import 'package:flutter/material.dart';
import 'package:shopify/models/constant.dart';

class ShoeModel {
  final String name;
  final double price;
  final Color color;
  final String brand;
  final String imgPath;
  final String desc;
  final bool synch;

  ShoeModel({this.name,this.price,this.color,this.brand,this.imgPath,this.synch,this.desc});

  static List<ShoeModel> list = [
     ShoeModel(
      name: "Custom kyrie 7",
      price: 10000,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "custom-kyrie-7.png",
      synch: true,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
   
     ShoeModel(
      name: "Mercurial Superfly 7",
      price: 8000,
      color: AppColors.yellowColor,
      brand: "Nike",
      imgPath: "mercurial-superfly-7-academy-mdcs.png",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      synch: true,
    ),
    
    ShoeModel(
      name: "kyrie 7",
      price: 12000,
      color: AppColors.greenColor,
      brand: "Nike",
      imgPath: "kyrie-7-ep.png",
      synch: true,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
     ShoeModel(
      name: "Lebron 18 Neon",
      price: 12000,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "lebron-18-low-neon-nights.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Air Jordan XXXIV",
      price: 12000,
      color: AppColors.blackColor,
      brand: "Nike",
      imgPath:"air-jordan-xxxiv-zion-.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Air Zoom",
      price: 8000,
      color: AppColors.indigoColor,
      brand: "Nike",
      imgPath: "Air-zoom.png",
      synch: true,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
   
    ShoeModel(
      name: "Mercurial Superfly 8",
      price: 12000,
      color: AppColors.purpleColor,
      brand: "Nike",
      imgPath: "custom-nike-mercurial-superfly-8-academy.png",
      synch: true,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    
    ShoeModel(
      name: "Kyrie Flytrap 4 ",
      price: 11000,
      color: AppColors.purpleColor,
      brand: "Nike",
      imgPath: "kyrie-flytrap-4-ep.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    
    ShoeModel(
      name: "Lebron Witness 5",
      price: 10000,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "lebron-witness-5-ep.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
   
    ShoeModel(
      name: "Mercurial Superfly 8",
      price: 11000,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "mercurial-superfly-8-elite.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Phantom GT Elite",
      price: 14000,
      color: AppColors.yellowColor,
      brand: "Nike",
      imgPath: "custom-nike-phantom-gt-elite.png",
      synch: true,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Mercurial Vapor 14",
      price: 13000,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "mercurial-vapor-14-academy.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Phantom GT",
      price: 8000,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "phantom-gt-academy.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
    ),
    ShoeModel(
      name: "Zoom Freak 2",
      price: 12000,
      color: AppColors.orangeColor,
      brand: "Nike",
      imgPath: "zoom-freak-2.png",
      synch: false,
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
      
    ),

  ];
}