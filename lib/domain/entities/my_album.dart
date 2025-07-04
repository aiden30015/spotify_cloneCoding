class MyAlbum {
  final String id;
  final String name;
  final String albumType;
  final List<String> artists;
  final List<String> availableMarkets;
  final String? imageUrl;
  final String releaseDate;
  final int totalTracks;
  final String type;
  final String uri;
  final String label;
  final int popularity;

  MyAlbum({
    required this.id,
    required this.name,
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    this.imageUrl,
    required this.releaseDate,
    required this.totalTracks,
    required this.type,
    required this.uri,
    required this.label,
    required this.popularity,
  });
} 