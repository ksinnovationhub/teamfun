import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';


import '../../../../core/utils/consts.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  final _dialog = RatingDialog(
    // your app's name?
    title: const Text('Rate Us On Play Store & App Store'),
    // encourage your user to leave a high rating?
    message: const Text('Select Number of Stars 1 - 5 to Rate This App'),
    // your app's logo?
    image: const FlutterLogo(size: 60),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
        StoreRedirect.redirect(
          androidAppId: 'shri.complete.fitness.gymtrainingapp',
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '     Rate Thumbprint   \n                 on  \n Play Store & App Store',
            style:
                GoogleFonts.roboto(fontSize: 35, fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: textfieldcolor),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              elevation: 10,
              onPressed: () {
                // load dialog to show it
                showDialog(
                  context: context,
                  builder: (context) => _dialog,
                );
              },
              child: const Text('Rate'),
            ),
          ),
        ],
      ),
    ));
  }
}
