import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/user/user_controller.dart';
import 'package:tp_beek_leek/src/widgets/circle_button.dart';
import 'package:tp_beek_leek/src/widgets/profile_background.dart';
import 'package:tp_beek_leek/src/widgets/user_info.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserController? _userController;

  @override
  void initState() {
    super.initState();
    _userController = UserController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileBackground(),
        ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'User',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  UserInfo(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleButton(true, Icons.vpn_key, 20.0,
                            Color.fromRGBO(255, 255, 255, 1), () => {}),
                        CircleButton(false, Icons.add, 20.0,
                            Color.fromRGBO(255, 255, 255, 1), _userController!.createPost),
                        CircleButton(true, Icons.exit_to_app, 20.0,
                            Color.fromRGBO(255, 255, 255, 0.6), _userController!.logout),
                      ],
                    ),
                  ),
                  FutureBuilder<List>(
                    future: _userController?.getPostsByUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: _userController!.buildPosts(snapshot.data!),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
