import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tp_beek_leek/src/models/post.dart';
import 'package:tp_beek_leek/src/provider/shared_pref.dart';
import 'package:tp_beek_leek/src/widgets/my_progress_dialog.dart';
import 'package:tp_beek_leek/src/widgets/post_widget.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class UserController {
  final BuildContext context;
  final SharedPref _sharedPref = SharedPref();

  UserController(this.context);

  Future<List<Post>> getPostsByUser() async {
    String? userId = await _sharedPref.read('userId');
    final response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      return [];
    }
  }

  List<PostWidget> buildPosts(List data) {
    final List<PostWidget> posts = [];
    for (var post in data) {
      posts.add(PostWidget(
          post: post, editable: true, edit: editPost, delete: deletePost));
    }
    return posts;
  }

  Future logout() async {
    await _sharedPref.remove('userId');
    await _sharedPref.remove('username');
    await _sharedPref.remove('email');
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }

  void createPost() {
    Navigator.pushNamed(context, 'createPost');
  }

  String getUserName() {
    return _sharedPref.read('username') as String;
  }

  void deletePost(int id) async {
    ProgressDialog progressDialog = MyProgressDialog.create(
        context, 'Deleting post...');
    await progressDialog.show();
    await delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    await progressDialog.hide();
  }

  void editPost(Post post) {
    Navigator.pushNamed(context, 'createPost', arguments: post);
  }
}
