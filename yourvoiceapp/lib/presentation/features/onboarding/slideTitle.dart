import 'package:flutter/material.dart';
import 'package:thumbprint/presentation/features/onboarding/sliderModel.dart';


import '../../../core/config/size_config.dart';


class SlideTile extends StatelessWidget {
   final SliderModel slide;


 const SlideTile({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical:10,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border.all(
                color: slide.color,
                width: 15,
              ),
              borderRadius: BorderRadius.circular(150),
            ),
            child: Image.asset(
              slide.imageAssetPath,
              height: 200,
            ),
          ),
          const SizedBox(
            height:10,
          ),
          Text(
            slide.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'SEGOEUI',
                fontWeight: FontWeight.bold,
                fontSize: 10,
                letterSpacing: 1.0
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              slide.desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  //fontFamily: 'SEGOEUI',
                  fontWeight: FontWeight.w500,
                  fontSize:10
              ),
            ),
          )
        ],
      ),
    );
  }
}
