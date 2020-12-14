import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yo_necesito/src/bloc/image/image_bloc.dart';
import 'package:flutter_yo_necesito/src/service/service.dart';
import 'package:flutter_yo_necesito/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductoOpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: [
        new _CustomList(),
        new _BottomOption()
      ],
    ));
  }
}

class _CustomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: new Column(
        children: [
          new _BuildBigImage(),
          new _BuildCarrousel(),
          new _BuildCardInfo()
        ],
      ),
    );
  }
}

class _BuildBigImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) => new _DisplayImage(
              state: state,
              size: size,
            ));
  }
}

class _DisplayImage extends StatelessWidget {
  final ImageState state;
  final size;
  _DisplayImage({@required this.state, @required this.size});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          image: new DecorationImage(
            image: NetworkImage(state.image),
            fit: BoxFit.cover,
          )),
      child: Container(
        child: new Stack(
          children: [
            new Positioned(
                top: 50,
                left: 20,
                child: Container(
                  width: size.width,
                  child: new Row(
                    children: [
                      new IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: new Icon (Icons.chevron_left,color: Colors.white,)
                      ),
                      new SizedBox(
                        width: size.width * 0.66,
                      ),
                      new Row(
                        children: [
                          new Icon(Icons.share, color: Colors.white),
                          new SizedBox(
                            width: 8,
                          ),
                          new Icon(
                            FontAwesomeIcons.ellipsisV,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _BuildCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 70,
      //color: Colors.red,
      child: new ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) =>
            new _Rectangulo(image: serviceImage.getImages[index]),
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  final String image;
  _Rectangulo({@required this.image});
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        BlocProvider.of<ImageBloc>(context).add(OnChangeImage(this.image));
      },
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 70,
        height: 70,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: new DecorationImage(
              image: NetworkImage(
                this.image,
              ),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class _BuildCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: size.height * 0.45,
      width: size.width,
      decoration: new BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: new Container(
        margin: EdgeInsets.only(left: 15, top: 30),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoTextTitle(),
            _infoTextSubtitles(),
            _infoEstado(),
            _infoImage()
          ],
        ),
      ),
    );
  }

  Widget _infoTextTitle() {
    return new Text(
      'Portatil mac 2012',
      style: getTheme.textTheme.headline6,
    );
  }

  Widget _infoTextSubtitles() {
    return new Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              'Antofagasta',
              style: getTheme.textTheme.headline4,
            ),
            new SizedBox(
              height: 4,
            ),
            new Row(
              children: [
                new Text(
                  'Publicado:',
                  style: getTheme.textTheme.subtitle1,
                ),
                new SizedBox(
                  width: 4,
                ),
                new Text(
                  'Sept 16 2020',
                  style: getTheme.textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _infoEstado() {
    return new Container(
      margin: EdgeInsets.only(bottom: 15, top: 13),
      child: new Row(
        children: [
          new Text(
            'Estado:',
            style: getTheme.textTheme.subtitle1,
          ),
          new SizedBox(
            width: 4,
          ),
          new Icon(
            FontAwesomeIcons.smile,
            color: Colors.blue,
          ),
          new SizedBox(
            width: 4,
          ),
          new Text(
            'Excelente',
            style: getTheme.textTheme.headline3,
          ),
        ],
      ),
    );
  }

  Widget _infoImage() {
    return new BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        return new Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: 70,
          height: 70,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: new DecorationImage(
                image: NetworkImage(
                  state.image,
                ),
                fit: BoxFit.cover,
              )),
        );
      },
    );
  }


}

class _BottomOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        height: 85,
        width: size.width,
        color: Colors.blue[50],
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _customButton(color: Colors.white,text: 'Preguntar'),
            _customButton(color: new Color(0xff3F90F6), text: '¡Lo Quiero!'),

          ],
        ),
      ),
    );
  }

  Widget _customButton({@required String text, @required Color color}) {
    return new Container(
      alignment: Alignment.center,
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: new Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: new Text(text,style: GoogleFonts.poppins(
        color: (color == Colors.white) ? Colors.black : Colors.white,
        fontWeight:(color == Colors.white) ? FontWeight.bold : FontWeight.normal
      ),
    ));

  }
}

