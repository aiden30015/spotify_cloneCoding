import 'package:json_annotation/json_annotation.dart';

part 'get_album.g.dart';

@JsonSerializable()
class Album {
  final String albumType;
  final int totalTracks;
  final List<String> availableMarkets;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final List<ImageObject> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final Restrictions? restrictions;
  final String type;
  final String uri;
  final List<SimplifiedArtist> artists;
  final Tracks tracks;
  final List<CopyrightObject> copyrights;
  final ExternalIds externalIds;
  final List<String> genres;
  final String label;
  final int popularity;

  Album({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    this.restrictions,
    required this.type,
    required this.uri,
    required this.artists,
    required this.tracks,
    required this.copyrights,
    required this.externalIds,
    required this.genres,
    required this.label,
    required this.popularity,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class ExternalUrls {
  final String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
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
class Restrictions {
  final String? reason;

  Restrictions({this.reason});

  factory Restrictions.fromJson(Map<String, dynamic> json) => _$RestrictionsFromJson(json);
  Map<String, dynamic> toJson() => _$RestrictionsToJson(this);
}

@JsonSerializable()
class SimplifiedArtist {
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  SimplifiedArtist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory SimplifiedArtist.fromJson(Map<String, dynamic> json) => _$SimplifiedArtistFromJson(json);
  Map<String, dynamic> toJson() => _$SimplifiedArtistToJson(this);
}

@JsonSerializable()
class Tracks {
  final String href;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;
  final List<SimplifiedTrack> items;

  Tracks({
    required this.href,
    required this.limit,
    this.next,
    required this.offset,
    this.previous,
    required this.total,
    required this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
  Map<String, dynamic> toJson() => _$TracksToJson(this);
}

@JsonSerializable()
class SimplifiedTrack {
  final List<SimplifiedArtist> artists;
  final List<String> availableMarkets;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final bool isPlayable;
  final LinkedTrack? linkedFrom;
  final Restrictions? restrictions;
  final String name;
  final String? previewUrl;
  final int trackNumber;
  final String type;
  final String uri;
  final bool isLocal;

  SimplifiedTrack({
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isPlayable,
    this.linkedFrom,
    this.restrictions,
    required this.name,
    this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
    required this.isLocal,
  });

  factory SimplifiedTrack.fromJson(Map<String, dynamic> json) => _$SimplifiedTrackFromJson(json);
  Map<String, dynamic> toJson() => _$SimplifiedTrackToJson(this);
}

@JsonSerializable()
class LinkedTrack {
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final String type;
  final String uri;

  LinkedTrack({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory LinkedTrack.fromJson(Map<String, dynamic> json) => _$LinkedTrackFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedTrackToJson(this);
}

@JsonSerializable()
class CopyrightObject {
  final String text;
  final String type;

  CopyrightObject({
    required this.text,
    required this.type,
  });

  factory CopyrightObject.fromJson(Map<String, dynamic> json) => _$CopyrightObjectFromJson(json);
  Map<String, dynamic> toJson() => _$CopyrightObjectToJson(this);
}

@JsonSerializable()
class ExternalIds {
  final String? isrc;
  final String? ean;
  final String? upc;

  ExternalIds({
    this.isrc,
    this.ean,
    this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => _$ExternalIdsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}