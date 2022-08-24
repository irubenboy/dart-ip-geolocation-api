// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ip_geolocation_api/src/models/geolocation_data.dart';

class GeolocationApi {
  static Future<GeolocationData?> getData({String query = ''}) async {
    try {
      final response =
          await http.get(Uri.parse("http://ip-api.com/json/$query"));

      if (response.statusCode == 200) {
        print(response.body);
        final parsed = jsonDecode(response.body);
        return GeolocationData.fromJson(parsed);
      }

      print("geolocation api ${response.statusCode}");
    } catch (e) {
      print(e);
    }
    return null;
  }
}
