import 'package:chat_gpt/features/app/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/app/home/home_page.dart';
import 'features/app/routes/on_generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      onGenerateRoute: OnGenerateRoute.route,
      initialRoute: '/',
      routes: {
        "/": (context) {
          return const SplashScreen(
            child: HomePage(),
          );
        }
      },
    );
  }
}
