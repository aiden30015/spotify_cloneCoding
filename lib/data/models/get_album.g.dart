// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
  albumType: json['albumType'] as String,
  totalTracks: (json['totalTracks'] as num).toInt(),
  availableMarkets:
      (json['availableMarkets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  externalUrls: ExternalUrls.fromJson(
    json['externalUrls'] as Map<String, dynamic>,
  ),
  href: json['href'] as String,
  id: json['id'] as String,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
  name: json['name'] as String,
  releaseDate: json['releaseDate'] as String,
  releaseDatePrecision: json['releaseDatePrecision'] as String,
  restrictions:
      json['restrictions'] == null
          ? null
          : Restrictions.fromJson(json['restrictions'] as Map<String, dynamic>),
  type: json['type'] as String,
  uri: json['uri'] as String,
  artists:
      (json['artists'] as List<dynamic>)
          .map((e) => SimplifiedArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
  tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
  copyrights:
      (json['copyrights'] as List<dynamic>)
          .map((e) => CopyrightObject.fromJson(e as Map<String, dynamic>))
          .toList(),
  externalIds: ExternalIds.fromJson(
    json['externalIds'] as Map<String, dynamic>,
  ),
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  label: json['label'] as String,
  popularity: (json['popularity'] as num).toInt(),
);

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
  'albumType': instance.albumType,
  'totalTracks': instance.totalTracks,
  'availableMarkets': instance.availableMarkets,
  'externalUrls': instance.externalUrls,
  'href': instance.href,
  'id': instance.id,
  'images': instance.images,
  'name': instance.name,
  'releaseDate': instance.releaseDate,
  'releaseDatePrecision': instance.releaseDatePrecision,
  'restrictions': instance.restrictions,
  'type': instance.type,
  'uri': instance.uri,
  'artists': instance.artists,
  'tracks': instance.tracks,
  'copyrights': instance.copyrights,
  'externalIds': instance.externalIds,
  'genres': instance.genres,
  'label': instance.label,
  'popularity': instance.popularity,
};

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) =>
    ExternalUrls(spotify: json['spotify'] as String?);

Map<String, dynamic> _$ExternalUrlsToJson(ExternalUrls instance) =>
    <String, dynamic>{'spotify': instance.spotify};

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

Restrictions _$RestrictionsFromJson(Map<String, dynamic> json) =>
    Restrictions(reason: json['reason'] as String?);

Map<String, dynamic> _$RestrictionsToJson(Restrictions instance) =>
    <String, dynamic>{'reason': instance.reason};

SimplifiedArtist _$SimplifiedArtistFromJson(Map<String, dynamic> json) =>
    SimplifiedArtist(
      externalUrls: ExternalUrls.fromJson(
        json['externalUrls'] as Map<String, dynamic>,
      ),
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$SimplifiedArtistToJson(SimplifiedArtist instance) =>
    <String, dynamic>{
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
  href: json['href'] as String,
  limit: (json['limit'] as num).toInt(),
  next: json['next'] as String?,
  offset: (json['offset'] as num).toInt(),
  previous: json['previous'] as String?,
  total: (json['total'] as num).toInt(),
  items:
      (json['items'] as List<dynamic>)
          .map((e) => SimplifiedTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
  'href': instance.href,
  'limit': instance.limit,
  'next': instance.next,
  'offset': instance.offset,
  'previous': instance.previous,
  'total': instance.total,
  'items': instance.items,
};

SimplifiedTrack _$SimplifiedTrackFromJson(
  Map<String, dynamic> json,
) => SimplifiedTrack(
  artists:
      (json['artists'] as List<dynamic>)
          .map((e) => SimplifiedArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
  availableMarkets:
      (json['availableMarkets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  discNumber: (json['discNumber'] as num).toInt(),
  durationMs: (json['durationMs'] as num).toInt(),
  explicit: json['explicit'] as bool,
  externalUrls: ExternalUrls.fromJson(
    json['externalUrls'] as Map<String, dynamic>,
  ),
  href: json['href'] as String,
  id: json['id'] as String,
  isPlayable: json['isPlayable'] as bool,
  linkedFrom:
      json['linkedFrom'] == null
          ? null
          : LinkedTrack.fromJson(json['linkedFrom'] as Map<String, dynamic>),
  restrictions:
      json['restrictions'] == null
          ? null
          : Restrictions.fromJson(json['restrictions'] as Map<String, dynamic>),
  name: json['name'] as String,
  previewUrl: json['previewUrl'] as String?,
  trackNumber: (json['trackNumber'] as num).toInt(),
  type: json['type'] as String,
  uri: json['uri'] as String,
  isLocal: json['isLocal'] as bool,
);

Map<String, dynamic> _$SimplifiedTrackToJson(SimplifiedTrack instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'discNumber': instance.discNumber,
      'durationMs': instance.durationMs,
      'explicit': instance.explicit,
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'isPlayable': instance.isPlayable,
      'linkedFrom': instance.linkedFrom,
      'restrictions': instance.restrictions,
      'name': instance.name,
      'previewUrl': instance.previewUrl,
      'trackNumber': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
      'isLocal': instance.isLocal,
    };

LinkedTrack _$LinkedTrackFromJson(Map<String, dynamic> json) => LinkedTrack(
  externalUrls: ExternalUrls.fromJson(
    json['externalUrls'] as Map<String, dynamic>,
  ),
  href: json['href'] as String,
  id: json['id'] as String,
  type: json['type'] as String,
  uri: json['uri'] as String,
);

Map<String, dynamic> _$LinkedTrackToJson(LinkedTrack instance) =>
    <String, dynamic>{
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': instance.type,
      'uri': instance.uri,
    };

CopyrightObject _$CopyrightObjectFromJson(Map<String, dynamic> json) =>
    CopyrightObject(text: json['text'] as String, type: json['type'] as String);

Map<String, dynamic> _$CopyrightObjectToJson(CopyrightObject instance) =>
    <String, dynamic>{'text': instance.text, 'type': instance.type};

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds(
  isrc: json['isrc'] as String?,
  ean: json['ean'] as String?,
  upc: json['upc'] as String?,
);

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'isrc': instance.isrc,
      'ean': instance.ean,
      'upc': instance.upc,
    };
