class Earthquake {
  final double mag;
  final double lng;
  final double lat;
  final String loc;
  final double depth;
  final String coordinates;
  final String title;
  final String rev;
  final String timestamp;
  final String date_stamp;
  final String date;
  final String hash;
  final String hash2;

  Earthquake({
    this.mag,
    this.lng,
    this.lat,
    this.loc,
    this.depth,
    this.coordinates,
    this.title,
    this.rev,
    this.timestamp,
    this.date_stamp,
    this.date,
    this.hash,
    this.hash2,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      mag: json['mag'] as double,
      lng: json['lng'] as double,
      lat: json['lat'] as double,
      loc: json['lokasyon'] as String,
      depth: json['depth'] as double,
      coordinates: json['coordinates'] as String,
      title: json['title'] as String,
      rev: json['rev'] as String,
      timestamp: json['timestamp'] as String,
      date_stamp: json['date_stamp'] as String,
      date: json['date'] as String,
      hash: json['hash'] as String,
      hash2: json['hash2'] as String,
    );
  }
}
