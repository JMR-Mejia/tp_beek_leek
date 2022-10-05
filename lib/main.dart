import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/feed/feed_page.dart';
import 'package:tp_beek_leek/src/pages/login/login_page.dart';

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
        'feed': (context) => const FeedPage(),
      },
    );
  }
}
