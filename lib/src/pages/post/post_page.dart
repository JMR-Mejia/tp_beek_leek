import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/post/post_controller.dart';
import 'package:tp_beek_leek/src/widgets/post_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final PostController _postController = PostController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FutureBuilder<List>(
            future: _postController.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: ListView(
                    children: _postController.buildPosts(snapshot.data!),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      );
  }
}
