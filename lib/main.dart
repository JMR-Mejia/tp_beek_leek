import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/login/login_page.dart';
import 'package:tp_beek_leek/src/pages/post/create/create_post_page.dart';
import 'package:tp_beek_leek/src/pages/register/register_page.dart';
import 'package:tp_beek_leek/src/pages/trips/trips.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'createPost': (context) => const CreatePostWidget(),
        'register': (context) => const RegisterPage(),
        'feed': (context) => const TripsPage(),
      },
    );
  }
}
