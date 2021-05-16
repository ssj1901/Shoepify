import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/models/cart.dart';


class ShopCart extends StatefulWidget {
  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
          //  padding: EdgeInsets.only(left: wid *0.3),
            child: Column(
              children: [
                
                 Text("My Cart",
                  style: GoogleFonts.roboto(color: Colors.black,fontSize: 20.sp),),
              
                Text(" ${shoppingCart.length} items",
                style: Theme.of(context).textTheme.caption,)
              ],
            ),
          ),
        ),
       
      ),
      body:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ),
      child: ListView.builder(itemCount: shoppingCart.length,itemBuilder: (context,index)=>Dismissible(
          direction: DismissDirection.endToStart,
            key: UniqueKey(),
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Color(0xFFFFE6E6)),
            child: Row(children: [
              Spacer(),
              Icon(Icons.delete_outline,size: 30,)
            ],),
            ),
            onDismissed: (direction){
              setState(() {
                  shoppingCart.removeAt(index);
                  totalSum();
                            });
            },
            child: CartItemCard(shoppingCart[index],wid)),),
    ), 
     
     
      bottomNavigationBar: custombottombar(),   
    );
  }

  Widget custombottombar() {
    return Container(
      padding: EdgeInsets.all(15),
      height: 180.h,
      decoration: BoxDecoration(
        color: Colors.white,
      borderRadius:BorderRadius.only(
        topLeft: Radius.circular(30),topRight: Radius.circular(30)
      ),
      boxShadow:[ BoxShadow(
        offset: Offset(0,-15),
        blurRadius: 20, 
        color: Color(0xffDADADA).withOpacity(0.15),
      ),]
      ),
       child: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long_rounded,size:50,color: Colors.orange[900],),
            //   Container(
            //     padding: EdgeInsets.all(10),
            //     height: 100.h,
            //     width: 100.w,
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF5F6F9),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            // //    child: SvgPicture.asset("assets/icons/receipt.svg"),
            //   ),
              Spacer(),
              Text("Add voucher code"),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
            //    color: kTextColor,
              )
            ],
          ),
         SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Total:\n",
                  children: [
                    TextSpan(
                      text: "${total_sum} Rs",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                width:130.w,
                height: 60.h ,
          
          decoration: BoxDecoration(
            color: Colors.orange[900],
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              "Check Out",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 15.sp
              ),
            ),
          ),
        ),
            ],
          ),
        ]
        
    ),
       ),
       );
  }

  Widget CartItemCard(Cart cart,double wid) {
    return Row(
        children:[
        SizedBox(
            width:wid *0.28,
            child: AspectRatio(
              aspectRatio: 5/6,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset("assets/images/${cart.shoe.imgPath}"),
              ),
            ),
        ),
        SizedBox(width:wid*0.05),
        Container(
          width: 150.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("${cart.shoe.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(fontSize: 16.sp,color: Colors.black),),
            SizedBox(height: 10.h,),
            Text.rich(TextSpan(
              text: "${cart.shoe.price} Rs",
              style:TextStyle(fontWeight: FontWeight.w600,color: Colors.redAccent[400]),
              children: [
                TextSpan(
                    text: "  x${cart.numItems}",
                    style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400)
                )
              ]
            ))
          ],),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.add_circle_outline_rounded), onPressed: (){
             setState(() {
                           cart.numItems += 1; 
                           totalSum();
                          }); 
            }),
         //   SizedBox(height: 5.h,),
            IconButton(icon: Icon(Icons.remove_circle_outline_outlined), onPressed: (){
              setState(() {
                           cart.numItems -= 1; 
                           if(cart.numItems == 0){
                             shoppingCart.remove(cart);
                             
                           }
                           totalSum();
                          }); 
            }),
          ],
        )
        ],
      );
  }
}


