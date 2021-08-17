import 'dart:convert';

import 'package:gigqo_assignment/model/Track.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "https://beta-api.gigqo.com/api";

  Future<List<Track>> getTracks() async {
    Response res = await get(Uri.parse('$apiUrl/mockup/tracks'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Track> tracks = body.map((dynamic item) => Track.fromJson(item)).toList();
      return tracks;
    } else {
      throw "Failed to load track list";
    }
  }

  Future<Track> getTrackById(String id) async {
    final response = await get(Uri.parse('$apiUrl/mockup/tracks/$id'));

    if (response.statusCode == 200) {
      return Track.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a track');
    }
  }

  Future<Track> createTrack(Track tracks) async {
    Map data = {
      'name': tracks.name,
      'artist': tracks.artist,
      'year': tracks.year,
      'cover': tracks.cover
    };

    final Response response = await post(Uri.parse(
      '$apiUrl/mockup/tracks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Track.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to post track');
    }
  }

  Future<Track> updateTrack(String id, Track tracks) async {
    Map data = {
      'name': tracks.name,
      'artist': tracks.artist,
      'year': tracks.year,
      'cover': tracks.cover
    };

    final Response response = await put(Uri.parse(
      '$apiUrl/mockup/tracks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Track.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a track');
    }
  }

  Future<void> deleteTrack(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/mockup/tracks/$id'));

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a track.";
    }
  }

}