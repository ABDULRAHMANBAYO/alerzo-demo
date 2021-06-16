import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget bottomText(String textOne, String textTwo, TextStyle textOneTextStyle,
        TextStyle textTwoTextStyle, Function onPressed) =>
    Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: textOne,
            style: textOneTextStyle,
            children: <TextSpan>[
              TextSpan(
                  text: textTwo,
                  style: textTwoTextStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      onPressed();
                    })
            ]),
      ),
    );
