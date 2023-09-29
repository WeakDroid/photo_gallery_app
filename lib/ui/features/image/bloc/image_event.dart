part of 'image_bloc.dart';

abstract class ImageDetailEvent extends Equatable {}

class LoadImageDetail extends ImageDetailEvent {
  LoadImageDetail({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
