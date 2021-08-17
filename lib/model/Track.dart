class Track {
  final String id;
  final String name;
  final String artist;
  final String year;
  final String cover;


  Track({ required this.id,required this.name, required this.artist,required this.year, required this.cover});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['_id'] as String,
      name: json['name'] as String,
      artist: json['artist'] as String,
      year: json['year'] as String,
      cover: json['cover'] as String,

    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $name, year: $year, artist: $artist, cover: $cover}';
  }
}