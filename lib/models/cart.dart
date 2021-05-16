import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "shoe_model.dart";
class Cart{

  final ShoeModel shoe;
   int numItems;

  Cart({@required this.shoe,@required this.numItems});
}

 List<Cart> shoppingCart = [
  // Cart(shoe: ShoeModel.shoemodel[0], numItems: 2),
  // Cart(shoe: ShoeModel.shoemodel[1], numItems: 1),
  // Cart(shoe: ShoeModel.shoemodel[2], numItems: 1),
];

double total_sum ;
void totalSum(){
  total_sum = 0;
                  shoppingCart.forEach((element) {
                total_sum = total_sum + (element.shoe.price * element.numItems);
              });
}