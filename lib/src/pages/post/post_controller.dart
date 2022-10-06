import 'dart:convert';

import 'package:http/http.dart';
import 'package:tp_beek_leek/src/models/post.dart';
import 'package:tp_beek_leek/src/widgets/post_widget.dart';

class PostController {
  Future<List<Post>> getPosts() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      return [];
    }
  }

  List<PostWidget> buildPosts(List data) {
    List<PostWidget> posts = [];
    for (var post in data) {
      posts.add(PostWidget(post: post));
    }
    return posts;
  }
}
