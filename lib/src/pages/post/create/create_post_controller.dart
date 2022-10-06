import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tp_beek_leek/src/provider/shared_pref.dart';
import 'package:tp_beek_leek/src/widgets/my_progress_dialog.dart';

class CreatePostController {
  BuildContext context;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final SharedPref _sharedPref = SharedPref();

  CreatePostController(this.context);

  Future createPost() async {
    ProgressDialog progressDialog = MyProgressDialog.create(
      context,
      'Creating post...',
    );
    await progressDialog.show();
    String? userId = await _sharedPref.read('userId');
    final response = await post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId!,
        'title': titleController.text,
        'body': bodyController.text,
      }),
    );
    await progressDialog.hide();
    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      throw Exception('Failed to create post.');
    }
  }
}
