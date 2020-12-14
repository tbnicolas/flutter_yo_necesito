part of 'image_bloc.dart';

@immutable
class ImageState {
  final String image;

  ImageState({
    this.image = 'https://images6.alphacoders.com/366/366149.jpg'
  });

  ImageState copyWith({
    String image
  }) => new ImageState(
    image: image ?? this.image
  );

}
