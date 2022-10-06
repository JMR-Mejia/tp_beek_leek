import 'dart:convert';

import 'package:http/http.dart';
import 'package:tp_beek_leek/src/models/album.dart';
import 'package:tp_beek_leek/src/models/photo.dart';
import 'package:tp_beek_leek/src/widgets/album_widget.dart';

class AlbumController {
  Future<List<Album>> getAlbums() async {
    Response response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums?_limit=10'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Album> albums =
          body.map((dynamic item) => Album.fromJson(item)).toList();
      return albums;
    } else {
      return [];
    }
  }

  List<AlbumWidget> buildAlbums(List data) {
    List<AlbumWidget> albums = [];
    for (var album in data) {
      albums.add(AlbumWidget(album: album, loadPhotos: getPhotos));
    }
    return albums;
  }

  Future<List<Photo>> getPhotos(int albumId) async {
    Response response = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/album/1/photos?_limit=3'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Photo> photos =
          body.map((dynamic item) => Photo.fromJson(item)).toList();
      return photos;
    } else {
      return [];
    }
  }
}
