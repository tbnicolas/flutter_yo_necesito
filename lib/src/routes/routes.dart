import 'package:flutter/material.dart';
import 'package:flutter_yo_necesito/src/pages/home_page.dart';
import 'package:flutter_yo_necesito/src/pages/producto_open_page.dart';

Map<String,WidgetBuilder> getRoutes(){
 return<String, WidgetBuilder>{
  '/'   :(BuildContext context) => new HomePage(),
  'producto':(BuildContext context) => new ProductoOpenPage(),
 };
}