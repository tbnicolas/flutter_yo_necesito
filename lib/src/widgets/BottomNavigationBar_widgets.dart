import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomNavigationBar extends StatelessWidget {
  final String texto;
  final IconData icon;
  final double size;
  final Color color;
  final bool border;
  CustomNavigationBar({
    @required this.icon,
    this.texto  = '',
    this.size   = 28.0,
    this.color = const Color(0xff3F90F6),
    this.border = false
  }): assert ( icon != null, 'Debe Prover un IconData al CustomNavigationBar' );

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 62,
      width: 62,
      //color: Colors.red,
      child: new Column(
        mainAxisAlignment: ( border ) ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
        children: [
          new Container(
            margin: ( !border ) ? EdgeInsets.only(top:9) : EdgeInsets.only(top:0),
            height: ( border ) ? 55: null ,
            width: ( border ) ? 55: null ,
            decoration: new BoxDecoration(
              border: Border.all(color: ( border ) ? new Color(0xffED8306) : Colors.white ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: new Icon(this.icon,size: this.size,color: this.color,)
          ),
          ( ! border ) ? new Text(this.texto,style: new TextStyle(
            fontSize: 12
          ),): new Container()
        ],
      ),
    );
  }
}