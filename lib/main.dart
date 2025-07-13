import 'package:flutter/material.dart';
import 'package:flutter_application_2lication_2/pages/profile_page.dart';
import 'package:flutter_application_2lication_2/pages/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfilePage(),
        '/tasks': (context) => const TasksPage(),
      },
    );
  }
}
