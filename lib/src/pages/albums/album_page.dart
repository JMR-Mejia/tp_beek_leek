import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/albums/album_controller.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late final AlbumController _albumController = AlbumController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List>(future: _albumController.getAlbums(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: ListView(
                children: _albumController.buildAlbums(snapshot.data!),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }))
      ],
    );
  }
}