part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class OnChangeImage extends ImageEvent {
  final String image;
  OnChangeImage(this.image);
}