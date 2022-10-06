import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/models/album.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;
  final Function loadPhotos;
  const AlbumWidget({super.key, required this.album, required this.loadPhotos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      // sombra en la parte izquierda
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0.0, 1.0),
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FutureBuilder<List>(
                future: loadPhotos(album.id),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('https://civilrights.msu.edu/_assets/images/placeholder/placeholder-600x600.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Text(
              album.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
