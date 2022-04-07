import 'package:flutter/widgets.dart';

// class SizeConfig{
//   late MediaQueryData _mediaQueryData;
//   late double screenWidth;
//   late double screenHeight;
//   late double safeAreaHorizontal;
//   late double safeAreaVertical;
//   late double safeBlockHorizontal;
//   late double safeBlockVertical;
//   late double topPadding;
//   late String screenSize;
//
//   void init(BuildContext context){
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//
//     topPadding = _mediaQueryData.padding.top;
//
//     safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//     safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//
//     safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
//     safeBlockVertical = (screenHeight - safeAreaVertical) / 100;
//
//     if(screenWidth >= 600){
//       screenSize = 'tablet';
//     }
//     else if(screenWidth >= 400){
//       screenSize = 'largeMobile';
//     }
//     else{
//       screenSize = 'smallMobile';
//     }
//
//   }
//
// }