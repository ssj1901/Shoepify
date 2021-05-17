import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/models/clipper_widget.dart';
import 'package:shopify/models/constant.dart';
import 'package:shopify/models/flutter_icons.dart';
import 'package:shopify/models/shoe_model.dart';
//import 'package:shopify/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'package:shopify/models/cart.dart';
class ItemDetail extends StatefulWidget {
  final ShoeModel shoeModel;
  
  ItemDetail(this.shoeModel);
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text("Home"),
        leading: IconButton(
          onPressed: ()=> {
          Navigator.pop(context,true),
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()))
          },
          icon: Icon(FlutterIcons.left_open_1),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .8,
                  child: ClipPath(
                    clipper: AppClipper(cornerSize: 50.h,diagonalHeight: 200.h ),
                  child: Container(
                    padding: EdgeInsets.only(top:200.h,left: 16.w,right:16.w),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.w,
                          child: Text("${widget.shoeModel.name}",style: TextStyle(fontSize: 33.sp,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(height: 12.h,),
                            buildRating(),
                            SizedBox(
                              height:15.h,
                            ),
                            Text("Details",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight:FontWeight.bold
                            )),
                            SizedBox(height: 10.h,),
                            Text("${widget.shoeModel.desc}",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black54,
                            )),
                            SizedBox(
                              height:15.h,
                            ),
                            Text("Colour Options",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight:FontWeight.bold
                            )),      
                            SizedBox(height: 8.h,) ,
                            Row(
                              children: [
                                _buildColorOptions(AppColors.redColor),
                                _buildColorOptions(AppColors.blueColor),
                                _buildColorOptions(AppColors.yellowColor),
                                _buildColorOptions(AppColors.greenColor),
                              ],
                            ),
                            SizedBox(
                              height:15.h,
                            ),
                            Text("Size Options",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight:FontWeight.bold
                            )),
                            SizedBox(
                              height:8.h,
                            ),
                            Row(
                              children: [
                                _buildSizeOptions("S"),
                                _buildSizeOptions("M"),
                                _buildSizeOptions("L"),
                              ],
                            )

                                     ],
                    ),
                  ),
            ),
                ),
              ),
         Positioned(
         bottom: 0,
         child: Container(
           height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Price",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Text(
                "${widget.shoeModel.price.toInt()} Rs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
          InkWell(
            splashColor: Colors.blue,
            onTap: (){
              
              setState(() {
                    shoppingCart.add(Cart(shoe: widget.shoeModel,numItems: 1));
                     totalSum();       
                            });
              final snackBar = SnackBar(
            content: Text('Added to your Cart!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                shoppingCart.removeLast();
                totalSum();
              },
            ),
          );

        
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
              
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
                     ),    
         Positioned(
           bottom: widget.shoeModel.synch? h * 0.55: h * 0.5,
           right: 10.h,
           child: Transform.rotate(
             angle: -math.pi/8,
             child: Image(
               width: MediaQuery.of(context).size.width * .85,
               image: AssetImage("assets/images/${widget.shoeModel.imgPath}",),),
           ),
         )            
                        ],
        ),
      ),
    );
  }

  Widget buildRating() {
    return Row(
                        children: [
                          Container(
                            child: RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
          
                          ),
                          SizedBox( width: 15.w),
                          Text("134 Reviews",
                          style: TextStyle(color: Colors.black45),)
                        ],
                      );
  }
}

Widget _buildColorOptions(Color color){
  return Container(
                                  width: 20.h,
                                  height: 20.h,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.all(Radius.circular(50),)
                                  ),
                                );
}

Widget _buildSizeOptions(String size){
  return Container(
                                  width: 30.h,
                                  height: 30.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.greenColor,
                                      width: 3
                                    ),
                                  ),
                                  child: Center(child: Text("$size",style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold),)),
                                );
}

 