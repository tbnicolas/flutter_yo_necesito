import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yo_necesito/src/routes/routes.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';

import 'src/bloc/image/image_bloc.dart';
import 'src/pages/home_page.dart';
import 'src/pages/producto_open_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> new ImageBloc())
      ],
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: getRoutes(),
        //theme: getTheme,
      ),
    );
  }
}