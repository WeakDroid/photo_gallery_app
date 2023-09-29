part of 'images_list_bloc.dart';

abstract class ImagesListEvent extends Equatable {}

class LoadImagesList extends ImagesListEvent {
  LoadImagesList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
