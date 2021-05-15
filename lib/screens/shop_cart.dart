import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/navig.dart';
import 'package:shopify/screens/homepage.dart';
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
      body:Body(wid: wid,), 
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 200.h,
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
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
              //    child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
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
         //   SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: Colors.black),
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
         ),   
    );
  }
}


//Body of screen

class Body extends StatefulWidget {
  final double wid;
  const Body({Key key,@required this.wid}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ),
      child: ListView.builder(itemCount: shoppingCart.length,itemBuilder: (context,index)=>Dismissible(
          direction: DismissDirection.endToStart,
            key: Key(shoppingCart[index].shoe.id.toString()),
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
                            });
            },
            child: CartItemCard(shoppingCart[index])),),
    );
  }

  Widget CartItemCard(Cart cart) {
    return Row(
        children:[
        SizedBox(
            width: widget.wid *0.35,
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
        SizedBox(width:widget.wid*0.05),
        Column(
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
        ],)
        ],
      );
  }
}
