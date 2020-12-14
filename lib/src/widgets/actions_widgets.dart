import 'package:flutter/material.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';


class ActionContainer extends StatelessWidget {
  final String text;
   ActionContainer({ 
     @required this.text
   }): assert( text != null, 'El texto del ACTION_CONTAINER no puede ser nulo');
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 35,
      width: 85,
      decoration: new BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: new Text(this.text,style: getTheme.textTheme.subtitle2),
    );
  }
}