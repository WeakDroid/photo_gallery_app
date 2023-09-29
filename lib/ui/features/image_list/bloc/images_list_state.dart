part of 'images_list_bloc.dart';

abstract class ImagesListState extends Equatable {}

class ImagesListInitial extends ImagesListState {
  @override
  List<Object?> get props => [];
}

class ImagesListLoading extends ImagesListState {
  @override
  List<Object?> get props => [];
}

class ImagesListLoaded extends ImagesListState {
  ImagesListLoaded({
    required this.imagesList,
  });

  final List<ImageModel> imagesList;

  @override
  List<Object?> get props => [imagesList];
}

class ImagesListLoadingFailure extends ImagesListState {
  ImagesListLoadingFailure({
    this.message,
  });

  final String? message;

  @override
  List<String?> get props => [message];
}
