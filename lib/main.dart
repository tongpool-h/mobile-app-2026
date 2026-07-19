import 'package:flutter/material.dart';

import 'pages/home_page.dart';
<<<<<<< HEAD
import 'pages/profile_page.dart';
=======
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/register_page.dart';

>>>>>>> 53147f8 (Updated)

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
<<<<<<< HEAD
      // home: const HomePage(),

      initialRoute: '/profile',
=======
      // home: const LoginPage(),

      initialRoute: '/register',
>>>>>>> 53147f8 (Updated)
      // initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        // '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
<<<<<<< HEAD
=======
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
>>>>>>> 53147f8 (Updated)
      },
    );
  }
}
