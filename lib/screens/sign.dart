import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/screens/login_page.dart';

const riveFile = 'assets/rive/77-114-car-example.riv';
class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  Artboard _artboard;
  @override
    void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFile);
    RiveFile rFile = RiveFile.import(bytes);

    setState(() => _artboard = rFile.mainArtboard
      ..addController(

          SimpleAnimation('Untitled 1'),
      ));
  }


  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
        _artboard != null
            ? Rive(
                artboard: _artboard,
                fit: BoxFit.cover,
              )
            : Container(),
        Positioned(
       //   left: 130.w,
          top: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome!",overflow: TextOverflow.ellipsis ,style: GoogleFonts.indieFlower(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none)),
              SizedBox(height: 15.h,),
              Text("SHOPIFY",overflow: TextOverflow.ellipsis ,style: GoogleFonts.freckleFace(
                color: Colors.white,
                fontSize: 60.sp,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    color: Color(0XFF0000FF),
                    offset: Offset(0.0,5.0),
                    blurRadius: 30.0,
                  )],),
                ),
 
 
              SizedBox(height: 120.h,),
              Text("All Your Shoe Desires in One Place",style: GoogleFonts.roboto(color: Colors.white.withOpacity(0.6),fontSize: 16.sp,decoration: TextDecoration.none),),
              SizedBox(height: 20.h,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 _custombutton("Sign Up",Color(0XFFC51162),Color(0XFFFFFFFF)),
                 SizedBox(width:20.w),
                 _custombutton("Sign In",Color(0XFFFFFFFF),Color(0XFFC51162)),

                  ],
                ),
              
            ],
          ),)
      ],),
      
    );
  }

  Widget _custombutton(String text,Color color1,Color color2) {
    return Container(
                 height: 50.h,
               child: GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
                 child: Container(
            width: 130.w,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF0000FF),
                    offset: Offset(0.0,5.0),
                    blurRadius: 30.0,
                  )],
                color: color1,
                borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                           text,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                                color: color2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                            ),
                        ),
                    )
                ],
            ),
        ),
    ),
);
  }
}