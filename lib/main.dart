import 'package:flutter/material.dart';
import 'package:nccapp/pages/cafe.dart';
import 'package:nccapp/pages/eventmanagement.dart';
import 'package:nccapp/pages/homepage.dart';
import 'package:nccapp/pages/login_page.dart';
import 'package:nccapp/pages/lostfound.dart';
import 'package:nccapp/pages/navigationpage.dart';
import 'package:nccapp/pages/signuppage.dart';
import 'package:nccapp/pages/studyres.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(username: ModalRoute.of(context)?.settings.arguments as String),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/study_resources': (context) => StudyResourcesPage(),
        '/campus_navigation': (context) => CampusNavigationPage(),
        '/events': (context) => EventPage(),
        '/cafeteria': (context) => CafeteriaPage(),
        '/lost_and_found': (context) => LostAndFoundPage(),
      },
    );
  }
}
