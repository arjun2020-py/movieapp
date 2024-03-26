import 'package:flutter/material.dart';

class ScreenTestHome extends StatelessWidget {
  const ScreenTestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Post Test Screen'),
      ),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
