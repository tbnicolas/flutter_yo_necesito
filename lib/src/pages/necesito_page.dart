import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';
import 'package:flutter_yo_necesito/src/widgets/button_widgets.dart';
import 'package:flutter_yo_necesito/src/widgets/text_widgets.dart';


class YoNecesitoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xff3F90F6),
        title: new Text('Yo necesito'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new _BuildImage(),
            new _BuildTitle(),
            new CustomText(texto: 'Que necesitas: ',texto2: 'Ingresa titulo de lo que buscas corto pero descriptivo',),
            new CustomText(texto: 'Categoria: ', texto2: 'elige la categoria donde alguien puede encontrar tu necesidad'),
            new CustomText(texto: 'Descripción: ',texto2: 'describe tu necesidad y porque estas buscando este producto, así las personas que lo tienen entenderán porque regalartelo',),
            new ButtomContinuar()
          ],
        ),
      ),
   );
  }
}

class _BuildImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: EdgeInsets.only(top:100),
        height: 300,
        width: 300,
        //color: Colors.red,
        child: SvgPicture.asset('assets/hello.svg'),
      ),
    );
  }
}

class _BuildTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 40),
        height: 40,
        //color: Colors.red,
        child: new Text(
          '¡Como publicar tu necesidad!',
          overflow: TextOverflow.ellipsis,
          style: getTheme.textTheme.headline6,
        ), 
      ),
    );
  }
}



