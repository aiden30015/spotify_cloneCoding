// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAlbumResponse _$GetAlbumResponseFromJson(Map<String, dynamic> json) =>
    GetAlbumResponse(
      href: json['href'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => AlbumItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      limit: (json['limit'] as num).toInt(),
      next: json['next'] as String?,
      offset: (json['offset'] as num).toInt(),
      previous: json['previous'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$GetAlbumResponseToJson(GetAlbumResponse instance) =>
    <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };

AlbumItem _$AlbumItemFromJson(Map<String, dynamic> json) => AlbumItem(
  addedAt: json['added_at'] as String,
  album: Album.fromJson(json['album'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AlbumItemToJson(AlbumItem instance) => <String, dynamic>{
  'added_at': instance.addedAt,
  'album': instance.album,
};

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
  albumType: json['album_type'] as String,
  artists:
      (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
  availableMarkets:
      (json['available_markets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  externalUrls: ExternalUrls.fromJson(
    json['external_urls'] as Map<String, dynamic>,
  ),
  id: json['id'] as String,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
  name: json['name'] as String,
  releaseDate: json['release_date'] as String,
  totalTracks: (json['total_tracks'] as num).toInt(),
  type: json['type'] as String,
  uri: json['uri'] as String,
);

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
  'album_type': instance.albumType,
  'artists': instance.artists,
  'available_markets': instance.availableMarkets,
  'external_urls': instance.externalUrls,
  'id': instance.id,
  'images': instance.images,
  'name': instance.name,
  'release_date': instance.releaseDate,
  'total_tracks': instance.totalTracks,
  'type': instance.type,
  'uri': instance.uri,
};

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
  externalUrls: ExternalUrls.fromJson(
    json['external_urls'] as Map<String, dynamic>,
  ),
  name: json['name'] as String,
  id: json['id'] as String,
  type: json['type'] as String,
  uri: json['uri'] as String,
);

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
  'external_urls': instance.externalUrls,
  'name': instance.name,
  'id': instance.id,
  'type': instance.type,
  'uri': instance.uri,
};

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) => ImageObject(
  url: json['url'] as String,
  height: (json['height'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
);

Map<String, dynamic> _$ImageObjectToJson(ImageObject instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) =>
    ExternalUrls(spotify: json['spotify'] as String?);

Map<String, dynamic> _$ExternalUrlsToJson(ExternalUrls instance) =>
    <String, dynamic>{'spotify': instance.spotify};
