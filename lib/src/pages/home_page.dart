import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_yo_necesito/src/service/service.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';
import 'package:flutter_yo_necesito/src/widgets/BottomNavigationBar_widgets.dart';
import 'package:flutter_yo_necesito/src/widgets/actions_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: new SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: new Column(
            children: [
              new _CustomAppBar(),
              new _CustomActions(), 
              new _CustomGrid(),
          ],),
        ),
        bottomNavigationBar: new _BottomNavigationBar(),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: size.width,
      height: 80,
      //color: Colors.red,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Container(
            alignment: Alignment.center,
            //padding: EdgeInsets.only(bottom:2.0),
            height: 50,
            width: size.width * 0.75,
            decoration: new BoxDecoration(
              //color: Colors.red,
              border: Border.all(color: Color(0xff3F90F6)),
              borderRadius: BorderRadius.circular(10)
            ),
            child: new Stack(
              children: [
                new Positioned(
                  height: 50,
                  width: size.width * 0.75,
                  top: -4,
                  child: new Container(
                    //color: Colors.red,
                    child: new ListTile(
                      title: new Text('Que deseas buscar?',style:getTheme.textTheme.headline5),
                      leading: new Icon(Icons.search,color: Color(0xff3F90F6),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            height: 50,
            width: 50,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: new Color(0xffED8306)),
            ),
            child: new Icon(Icons.tune,size:30 ,color: new Color(0xffED8306),),
          )
        ],
      ),
    );
  }
}


class _CustomGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: serviceImage.getImages.length,
      itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'producto');
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color:Colors.blue[200]
              ),
              child:  new CachedNetworkImage(
                  imageUrl: serviceImage.getImages[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => new Center(child: new CircularProgressIndicator()),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                )
               
            ),
          );
      }, 
        
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
   );
  }
}

class _CustomActions  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal:15,),
      width: size.width,
      height: 70,
      //color:Colors.red,
      child: new Row(children: [
        new ActionContainer(text: 'Recojer',),
        new ActionContainer(text: 'Enviar',),
        new ActionContainer(text: 'Valparaiso',),
      ],),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.of(context).size;
    return new Container(
      height: 75,
      width: size.width,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          new CustomNavigationBar(texto: 'Home',icon: Icons.home_outlined ,),
          new CustomNavigationBar(icon: FontAwesomeIcons.commentDots, color: Colors.black.withOpacity(0.8),),
          new GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'necesito');
            },
            child: new CustomNavigationBar(icon: Icons.add_circle_outline_rounded,size: 40.0 ,color: Color(0xffED8306),border: true,)
          ),
          new CustomNavigationBar(icon:  FontAwesomeIcons.handshake, color: Colors.black.withOpacity(0.8)),
          new CustomNavigationBar(icon:  FontAwesomeIcons.user ,color: Colors.black.withOpacity(0.8)),
        ],
      ),
    );
   
  }
}

