import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/models/brands.dart';
 class Custom_Swiper extends StatefulWidget {
   @override
   _Custom_SwiperState createState() => _Custom_SwiperState();
 }
 
 class _Custom_SwiperState extends State<Custom_Swiper> {
   @override
   Widget build(BuildContext context) {
     return Container(
                height: 400.h,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: brands.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 50),
                              Container(
                                height: 300.h,
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            height: 150.h,
                                            child: Hero(
                            tag: brands[index].imgUrl,
                            child: Image.asset(brands[index].imgUrl,fit: BoxFit.contain,),
                          ),
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                        // Text(
                                        //   planets[index].name,
                                        //   style: TextStyle(
                                        //     fontFamily: 'Avenir',
                                        //     fontSize: 44,
                                        //     color: const Color(0xff47455f),
                                        //     fontWeight: FontWeight.w900,
                                        //   ),
                                        //   textAlign: TextAlign.left,
                                        // ),
                                        // Text(
                                        //   'Solar System',
                                        //   style: TextStyle(
                                        //     fontFamily: 'Avenir',
                                        //     fontSize: 23,
                                        //     color: primaryTextColor,
                                        //     fontWeight: FontWeight.w500,
                                        //   ),
                                        //   textAlign: TextAlign.left,
                                        // ),
                                        // SizedBox(height: 32),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'View More',
                                              style: GoogleFonts.roboto(
                                              
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Hero(
                          //   tag: brands[index].imgUrl,
                          //   child: Image.asset(brands[index].imgUrl,fit: BoxFit.contain,),
                          // ),
                          
                        ],
                      ),
                    );
                  },
                ),
              );
   }
 }