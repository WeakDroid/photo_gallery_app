import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String name;
  final String author;
  final String imageUrl;

  const ImageModel({
    required this.name,
    required this.author,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [name, author, imageUrl];
}
