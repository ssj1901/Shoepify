import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shopify/models/advertisment.dart';
import 'package:shopify/models/clipper_widget.dart';
import 'package:shopify/models/constant.dart';
import 'package:shopify/models/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/models/shoe_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

import 'package:shopify/screens/item_detail.dart';
import 'package:shopify/screens/swiper.dart';
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ShoeModel> shoeList = ShoeModel.shoemodel;
   double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  
  @override
  Widget build(BuildContext context) {

    int _currentIndex = 0;  
    var h =MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          HiddenDrawer(),
          AnimatedContainer(

            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.80 : 1.0)
              ..rotateZ(isDrawerOpen ? -50 : 0),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  isDrawerOpen ? BorderRadius.circular(20) : BorderRadius.circular(0),
            ),

            child: Container(
              color: Color(0XFFFFFFFF),
               child: SafeArea(
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                   child: Column(
                     children: [
                       SizedBox(height: 10.h,),
                        Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          isDrawerOpen
                              ? IconButton(
                                    onPressed: (){
                                      setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      isDrawerOpen = false;
                                    });
                                    },
                                    icon:Icon(Icons.arrow_back_ios,),
                                    iconSize: 20,)
                              : 
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                      xOffset = 290;
                                      yOffset = 80;
                                      isDrawerOpen = true;
                                    });
                                },
                                icon:Icon(FlutterIcons.menu,),
                                iconSize: 20,),
                                IconButton(icon: Icon(FlutterIcons.search,color: Colors.black,),iconSize: 20, onPressed: null),
                                  
                         // Container(),
                        ],
                      ),
                    ),
                  SizedBox(height: 10.h,),
                  Expanded(
                  child: ListView(
                           children: [
                             
               CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: ads
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.black87,
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        elevation: 6.0,
                        shadowColor: Color(0xffDADADA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image(
                                  image:AssetImage(
                                  item.ad_url),
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                                    ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            
            SizedBox(height: 15.h,),


                             Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Latest In",
                                 style: TextStyle(
                                   color: Colors.black87,
                                 fontWeight: FontWeight.w700,
                                 fontSize: 30.sp,
                                 )),
                                 
                               ],
                             ),),
                             
                             Container(
                               margin: EdgeInsets.only(left: 10),
                               height: 300.h,
                               child: ListView.builder(
                                 itemCount: 4,
                                 scrollDirection: Axis.horizontal,
                                 physics: BouncingScrollPhysics(),
                                 itemBuilder: (context,index){
                                 return InkWell(
                                   onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(shoeList[index])));
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only(right: 10),
                                     width: 173.w,
                                     child: Stack(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top:30),
                                           child: _buildBackground(index,173.w),
                                         ),
                                         shoeList[index].synch ? Positioned(
                                          bottom: 110.h,
                                          // right: 0,
                                           child: Transform.rotate(
                                             angle: -math.pi / 7,
                                             child: Image(
                                               width: 170.w,
                                               image: AssetImage("assets/images/${shoeList[index].imgPath}")),
                                           ),
                                         ) 
                                         :
                                         Positioned(
                                         bottom: 85.h,
                                           right: 0,
                                           child: Transform.rotate(
                                             angle: -math.pi / 6,
                                             child: Image(
                                               width: 180.w,
                                               image: AssetImage("assets/images/${shoeList[index].imgPath}")),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 );
                               }),
                             ),
                             SizedBox(height: 20.h,),
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 10),
                               child: Text("Top Brands",
                               style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                             ),
                            
                            SizedBox(height: 10,),
                            //  Container(
                            //    height: 100.h,
                            //    child: ListView.builder(
                            //      itemCount: 6,
                            //        scrollDirection: Axis.horizontal,
                            //        physics: BouncingScrollPhysics(),
                            //      itemBuilder: (context,index){
                            //        return InkWell(
                            //          child:  Container(
                            //            margin: EdgeInsets.symmetric(horizontal: 10),
                            //           padding: EdgeInsets.all(15),
                            //           height: 25.h,
                            //           width: 70.w,
                                      
                            //           decoration: BoxDecoration(
                            //             color: Colors.black,
                            //             boxShadow: [BoxShadow(color:Colors.grey,
                            //             blurRadius: 1.0,),],
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //           child: Column(
                            //             crossAxisAlignment: CrossAxisAlignment.center,
                            //             children: [
                            //               Icon(FlutterIcons.nike,color: Colors.white,size: 30,),
                            //               //SizedBox(height:10),
                            //               Text("Nike",style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.w900),textAlign: TextAlign.center,)
                            //             ]
                            //           ),
                                  
                            //     ),
                            //                                 );
                            //      },
                            //    ),
                            //  ),

                            Custom_Swiper(),

                              SizedBox(height: 20.h,),
                             Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Just For You",
                                 style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                                 Text("View All",
                                 style: TextStyle(color: AppColors.greenColor,fontSize: 20.sp,fontWeight: FontWeight.w600),)
                               ],
                             ),
                             ),
                             SizedBox(
                               height: 25.h,
                             ),
                             ...shoeList.map((data) {
                               return InkWell(
                                   onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(data)));
                                   },
                                 child: Container(
                                   margin: EdgeInsets.only(left: 20,right:10,bottom: 15),
                                   padding: EdgeInsets.symmetric(vertical:0,horizontal: 10),
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(
                                       Radius.circular(25),
                                     ),
                                     boxShadow: [
                                       BoxShadow(
                                         color: Colors.black12,
                                         spreadRadius: 1,
                                         blurRadius: 10),
                                     ]
                                   ),
                                   child: Row(
                                     children: [
                                     Image(image: AssetImage("assets/images/${data.imgPath}"),
                                     width: 100.w,
                                     height: 150.h,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * .4,
                                            child: Text("${data.name}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp),),
                                          ),
                                          Text("${data.brand}",
                                          style: TextStyle(color: Colors.black45,height: 1.5.h),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text("${data.price.toInt()} Rs",
                                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),),
                                    ),
                                   ],),
                                 ),
                               );
                             }),
                           ],
                         ),
                ),
                     ],
                   ),
                 ),
               ),
            ),
          ),
        ],
      ),
    );
  }


//Hidden Drawer

  Widget HiddenDrawer() {
    return Container(
    color: Colors.tealAccent[700],
    child: Padding(
      padding: EdgeInsets.only(top: 50.h, left: 40.w, bottom: 70.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Harry Bean',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              _customRow(
               'Profile',
                Icons.person_outline,
              ),
              
              
              SizedBox(
                height: 20,
              ),
              _customRow(
               'Your Cart',
                Icons.shopping_cart_outlined,
              ),
              SizedBox(
                height: 20,
              ),
              _customRow(
               'Saved',
                Icons.bookmark_border,
              ),
              SizedBox(
                height: 20,
              ),
              _customRow(
               'Language',
                Icons.language_outlined
              ),
              SizedBox(
                height: 20,
              ),
              _customRow(
               'Help',
                Icons.lightbulb_outline,
              ),
              SizedBox(
                height: 20,
              ),
              
              _customRow(
               'Settings',
                Icons.error_outline,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    ),
  );
  }



  Widget _customRow(String text,IconData icon){
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }


//BackGround of LatestIn Shoes

  Widget _buildBackground(int index,double width) {
    return ClipPath(
          clipper: AppClipper(cornerSize: 25.h,diagonalHeight: 120.h),
           child: Container(
               width:width,
               color: shoeList[index].color,
               
               child: Stack(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(16),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:10),
                           child: Icon(FlutterIcons.nike,
                           size: 30,
                           color:Colors.white),
                         ),
                         Expanded(child:SizedBox()),
                         Container(
                           width: 125.w,
                           child: Text("${shoeList[index].name}",style: TextStyle(
                             color: Colors.white,
                             fontWeight:FontWeight.w400,
                             fontSize: 16.sp)),
                         ),
                         SizedBox(height: 15.h,),
                         Text("${shoeList[index].price} Rs",style: TextStyle(
                           color: Colors.white,
                           fontWeight:FontWeight.bold,
                           fontSize: 18.sp,
                         ),
                         ),
                         SizedBox(height: 15.h,)
                       ],
                     ),
                   ),
                   Positioned(
                     bottom: 0,
                     right: 0,
                     child: Container(
                       width: 40.w,
                       height:50.h,   
                       decoration: BoxDecoration(
                         color: shoeList[index].color == AppColors.greenColor ? AppColors.blueColor : AppColors.greenColor,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                       ),              
                       child: Center(child: Icon(
                         FlutterIcons.add,
                         color: Colors.white
                       ),),    ),
                   )
                 ],
               ),),
         );
  }
}

