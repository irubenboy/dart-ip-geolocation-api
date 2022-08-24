class GeolocationData {
  final String country, countryCode, timezone, ip;
  final double lat, lon;

  GeolocationData(
      {required this.country,
      required this.countryCode,
      required this.timezone,
      required this.ip,
      required this.lat,
      required this.lon});

  factory GeolocationData.fromJson(Map<String, dynamic> json) =>
      GeolocationData(
          country: json['country'],
          countryCode: json['countryCode'],
          timezone: json['timezone'],
          ip: json['query'],
          lat: json['lat'],
          lon: json['lon']);

  Map<String, dynamic> toJson() => {
        "country": country,
        "countryCode": countryCode,
        "timezone": timezone,
        "ip": ip,
        "lat": lat,
        "lon": lon
      };
}
