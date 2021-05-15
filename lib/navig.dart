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
  ];
  @override

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
       body: 
        _page[_currentIndex],
       
       floatingActionButton: Container(
         height: 70.h,
         width: 70.w,
         child: FloatingActionButton(
           
           backgroundColor: Colors.black,
           splashColor: Colors.blue,
           child: Icon(Icons.mic_none,size: 30.h),
           onPressed: (){},
         ),
       ),
       bottomNavigationBar:BottomAppBar(
         shape: CircularNotchedRectangle(),
         notchMargin: 10,
         child: Container(
           color: Colors.grey[200],
           height:70.h,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   MaterialButton(onPressed: (){
                     setState((){
                       _currentIndex = 0;
                     });
                   },
                   minWidth: width/2,
                   child:Icon(
                     _currentIndex==0?Icons.home_rounded:Icons.home_outlined,
                      size: 25.h,
                     color:_currentIndex==0?Colors.orange:Colors.black,
                   ),
                   ),
                   // Expanded(),
                   MaterialButton(onPressed: (){
                     setState((){
                       _currentIndex = 1;
                     });
                   },
                   minWidth: width/2,
                   child:Icon(
                     _currentIndex==1?Icons.shopping_cart_rounded:Icons.shopping_cart_outlined, size: 25.h,
                     color:_currentIndex==1?Colors.orange:Colors.black,
                     
                   ),
                   ),
                 ]
               ),
             ]
           )
         ),
       ),
        // BottomNavigationBar(         
        //   currentIndex: 0,
        //   backgroundColor: Colors.blueGrey[200],
        //   showUnselectedLabels: false,
        //   showSelectedLabels: false,
        // //  key: _bottomNavigationKey,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(title: Text("home"),icon:Icon(Icons.home, size: 30,color:Colors.white), ),
        //     BottomNavigationBarItem(title: Text("cart"),icon:Icon(Icons.shopping_cart, size: 30,color:Colors.white),),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}