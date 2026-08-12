import 'package:flutter/material.dart';
import 'package:mobile_app/pages/intro_screen.dart';
import 'package:mobile_app/pages/main_page.dart';

import 'pages/home_page.dart';
import 'pages/login_app.dart';
import 'pages/profile_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
// import 'pages/login_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App name
      title: 'My Flutter App',

      // Remove DEBUG banner
      debugShowCheckedModeBanner: false,

      // Light theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      // Dark theme
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // Follow device theme
      themeMode: ThemeMode.system,

      // First screen
      // home: const HomePage(),

      initialRoute: '/intro',
      // initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        // '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/loginapp': (context) => const LoginApp(),
        '/mainPage': (context) => const MainPage(),
        '/intro': (context) => const IntroScreen(),
      },
    );
  }
}
