import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tp_beek_leek/src/provider/shared_pref.dart';
import 'package:tp_beek_leek/src/widgets/my_progress_dialog.dart';

class RegisterController {
  BuildContext context;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final SharedPref _sharedPref = SharedPref();

  RegisterController(this.context);

  void register() async {
    ProgressDialog progressDialog = MyProgressDialog.create(
      context,
      'Registering...',
    );
    await progressDialog.show();
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    if (username.isNotEmpty && email.isNotEmpty) {
      Response response = await post(Uri.parse('https://jsonplaceholder.typicode.com/users'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'email': email,
          }));
      if (response.statusCode == 201) {
        saveUsername(username);
        saveEmail(email);
        saveUserId("11");
        await progressDialog.hide();
        Navigator.pushNamedAndRemoveUntil(context, 'feed', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Usuario no encontrado'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El campo username no puede estar vacio'),
        ),
      );
    }
    await progressDialog.hide();
  }

  void saveUsername(String username) async {
    _sharedPref.save('username', username);
  }

  void saveUserId(String userId) async {
    _sharedPref.save('userId', userId);
  }

  void saveEmail(String email) async {
    _sharedPref.save('email', email);
  }
}
