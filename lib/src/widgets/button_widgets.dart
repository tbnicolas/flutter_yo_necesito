import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtomContinuar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8,25,8,10),
      height: 50,
      decoration: new BoxDecoration(
        color: new Color(0xff3F90F6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: new Offset(2, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: new Text('Continuar',style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),),
    );
  }
}