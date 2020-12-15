import 'package:flutter/material.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String texto;
  final String texto2;
  CustomText({@required this.texto, @required this.texto2});
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      //height: 100,
      //color: Colors.red,
      child: new RichText(
        text: new TextSpan(
            text: this.texto,
            style: GoogleFonts.roboto(
                color: Colors.black, 
                fontWeight: FontWeight.w500, 
                fontSize: 15.5
            ),
            children: <TextSpan>[
              new TextSpan(
                text: this.texto2,
                style: GoogleFonts.roboto(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15.5
                ),
              )
            ]),
      ),
    );
  }
}


