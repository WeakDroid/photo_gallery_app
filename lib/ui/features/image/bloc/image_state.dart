part of 'image_bloc.dart';

abstract class ImageDetailState extends Equatable {}

class ImageDetailInitial extends ImageDetailState {
  @override
  List<Object?> get props => [];
}

class ImageDetailLoading extends ImageDetailState {
  @override
  List<Object?> get props => [];
}

class ImageDetailLoaded extends ImageDetailState {
  ImageDetailLoaded({
    required this.image,
  });

  final List<ImageModel> image;

  @override
  List<Object?> get props => [image];
}

class ImageDetailLoadingFailure extends ImageDetailState {
  ImageDetailLoadingFailure({
    this.message,
  });

  final String? message;

  @override
  List<String?> get props => [message];
}