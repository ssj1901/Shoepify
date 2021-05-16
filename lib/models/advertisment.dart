import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Advertisement {
  final ad_url;
  Advertisement({@required this.ad_url});
}

List<Advertisement>  ads = [
  Advertisement(ad_url:"assets/images/ad1.png" ),
  Advertisement(ad_url:"assets/images/ad2.jpeg" ),
  Advertisement(ad_url:"assets/images/ad3.png" ),
  Advertisement(ad_url:"assets/images/ad4.png" ),
  Advertisement(ad_url:"assets/images/ad5.jpeg" ),
  Advertisement(ad_url:"assets/images/ad6.jpeg" ),
  Advertisement(ad_url:"assets/images/ad7.jpg" ),
  Advertisement(ad_url:"assets/images/ad8.jpg" ),
];