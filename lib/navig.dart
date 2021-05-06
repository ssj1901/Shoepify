import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:shopify/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopify/screens/profile.dart';
import 'package:shopify/screens/shop_cart.dart';


class Navig extends StatefulWidget {
  Navig({Key key}) : super(key: key);

  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;
  List<Widget>  _page = [
    Home(),
    ShopCart(),
    Profile(),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
       body: 
        _page[_currentIndex],
       
       
       bottomNavigationBar: CurvedNavigationBar(         
         height: 60.h,
          backgroundColor: Colors.white,
           color: Colors.black87,
          buttonBackgroundColor: Colors.black,
        //  key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30,color:Colors.white),
            Icon(Icons.shopping_cart, size: 30,color:Colors.white),
            Icon(Icons.person,size:30,color:Colors.white)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }
}