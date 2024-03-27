import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constents.dart';
import '../lead/screen_lead.dart';
import '../login/view/screen_login.dart';
import '../utils/localStorage/local_storage.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  splash() async {
    token = await LocalStorage().getStringData();
    Future.delayed(Duration(milliseconds: 500),(){
       Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => token == null ? ScreenLogin() : ScreenLead(),
    ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('task 1'),
      ),
    );
  }
}
