import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tp_beek_leek/src/provider/shared_pref.dart';
import 'package:tp_beek_leek/src/widgets/my_progress_dialog.dart';

class LoginController {
  BuildContext context;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  final SharedPref _sharedPref = SharedPref();

  LoginController(this.context);

  void login() async {
    ProgressDialog progressDialog = MyProgressDialog.create(
      context,
      'Logging in...',
    );
    await progressDialog.show();
    String username = usernameController.text.trim();
    if (username.isNotEmpty) {
      Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users?username=$username'));
      await progressDialog.hide();
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          saveUsername(username);
          saveUserId(data[0]['id'].toString());
          saveEmail(data[0]['email']);
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
          SnackBar(
            content: const Text('Usuario no encontrado'),
          ),
        );
      }
      // Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El campo username no puede estar vacio'),
        ),
      );
    }
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

  // register
  void register() {
    Navigator.pushNamed(context, 'register');
  }
  
}
