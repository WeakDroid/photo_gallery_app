import 'package:json_annotation/json_annotation.dart';

part 'image_remote.g.dart';

@JsonSerializable()
class ImageRemote {
  @JsonKey(name: "hits")
  List<HitRemote>? hits;

  ImageRemote({
    this.hits,
  });

  factory ImageRemote.fromJson(Map<String, dynamic> json) =>
      _$ImageRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$ImageRemoteToJson(this);
}

@JsonSerializable()
class HitRemote {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "tags")
  String? name;
  @JsonKey(name: "user")
  String? author;
  @JsonKey(name: "largeImageURL")
  String? imageUrl;

  HitRemote({
    this.id,
    this.name,
    this.author,
    this.imageUrl,
  });

  factory HitRemote.fromJson(Map<String, dynamic> json) =>
      _$HitRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$HitRemoteToJson(this);
}
