import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../lead/screen_lead.dart';
import '../login/view/screen_login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  splash() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    Future.delayed(Duration(milliseconds: 500), () {
      if (token == null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenLead(),
        ));
      }
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
