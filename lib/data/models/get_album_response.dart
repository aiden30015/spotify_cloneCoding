import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_clone/domain/entities/my_album.dart';

part 'get_album_response.g.dart';

@JsonSerializable()
class GetAlbumResponse {
  final String href;
  final List<AlbumItem> items;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;

  GetAlbumResponse({
    required this.href,
    required this.items,
    required this.limit,
    this.next,
    required this.offset,
    this.previous,
    required this.total,
  });

  factory GetAlbumResponse.fromJson(Map<String, dynamic> json) => _$GetAlbumResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAlbumResponseToJson(this);
}

@JsonSerializable()
class AlbumItem {
  @JsonKey(name: 'added_at')
  final String addedAt;
  final AlbumData album;

  AlbumItem({
    required this.addedAt,
    required this.album,
  });

  factory AlbumItem.fromJson(Map<String, dynamic> json) => _$AlbumItemFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumItemToJson(this);
}

@JsonSerializable()
class AlbumData {
  @JsonKey(name: 'album_type')
  final String albumType;
  final List<Artist> artists;
  @JsonKey(name: 'available_markets')
  final List<String> availableMarkets;
  @JsonKey(name: 'external_urls')
  final ExternalUrls externalUrls;
  final String id;
  final List<ImageObject> images;
  final String name;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'total_tracks')
  final int totalTracks;
  final String type;
  final String uri;
  final String label;
  final int popularity;

  AlbumData({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.totalTracks,
    required this.type,
    required this.uri,
    required this.label,
    required this.popularity,
  });

  factory AlbumData.fromJson(Map<String, dynamic> json) => _$AlbumDataFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumDataToJson(this);
}

@JsonSerializable()
class Artist {
  @JsonKey(name: 'external_urls')
  final ExternalUrls externalUrls;
  final String name;
  final String id;
  final String type;
  final String uri;

  Artist({
    required this.externalUrls,
    required this.name,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}

@JsonSerializable()
class ImageObject {
  final String url;
  final int? height;
  final int? width;

  ImageObject({
    required this.url,
    this.height,
    this.width,
  });

  factory ImageObject.fromJson(Map<String, dynamic> json) => _$ImageObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ImageObjectToJson(this);
}

@JsonSerializable()
class ExternalUrls {
  final String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
}

extension GetAlbumResponseExt on GetAlbumResponse {
  List<MyAlbum> toEntities() {
    return items.map((item) => item.album.toEntity()).toList();
  }
}

extension AlbumDataExt on AlbumData {
  MyAlbum toEntity() {
    return MyAlbum(
      id: id,
      name: name,
      albumType: albumType,
      artists: artists.map((artist) => artist.name).toList(),
      availableMarkets: availableMarkets,
      imageUrl: images.isNotEmpty ? images.first.url : null,
      releaseDate: releaseDate,
      totalTracks: totalTracks,
      type: type,
      uri: uri,
      label: label,
      popularity: popularity,
    );
  }
}