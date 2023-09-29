// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageRemote _$ImageRemoteFromJson(Map<String, dynamic> json) => ImageRemote(
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => HitRemote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageRemoteToJson(ImageRemote instance) =>
    <String, dynamic>{
      'hits': instance.hits,
    };

HitRemote _$HitRemoteFromJson(Map<String, dynamic> json) => HitRemote(
      id: json['id'] as int?,
      name: json['tags'] as String?,
      author: json['user'] as String?,
      imageUrl: json['largeImageURL'] as String?,
    );

Map<String, dynamic> _$HitRemoteToJson(HitRemote instance) => <String, dynamic>{
      'id': instance.id,
      'tags': instance.name,
      'user': instance.author,
      'largeImageURL': instance.imageUrl,
    };
