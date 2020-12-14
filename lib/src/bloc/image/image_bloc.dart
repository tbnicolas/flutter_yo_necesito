import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageState());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event,) async* {
    if( event is OnChangeImage ) {
      yield state.copyWith(image: event.image);
    }
  }
}
