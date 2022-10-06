import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/albums/album_page.dart';
import 'package:tp_beek_leek/src/pages/post/post_page.dart';
import 'package:tp_beek_leek/src/pages/user/user_page.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: MediaQuery.of(context).size.height * 0.07,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_frames_outlined),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album_outlined),
              label: 'Albums',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return PostPage();
            case 1:
              return AlbumPage();
            case 2:
              return UserPage();
            default:
              return PostPage();
          }
        },
      ),
    );
  }
}
