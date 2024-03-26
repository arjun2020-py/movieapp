import 'package:flutter/material.dart';

import 'screen/splash/view/splash_screen.dart';
import 'screen/task_1/lead/screen_lead.dart';
import 'screen/task_1/login/view/screen_login.dart';
import 'screen/task_1/splash/screen_splash.dart';
import 'screen/test/view/screen_leads.dart';
import 'screen/test/view/screen_post.dart';
import 'screen/test/view/screen_resource_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenSplash(),
    );
  }
}


