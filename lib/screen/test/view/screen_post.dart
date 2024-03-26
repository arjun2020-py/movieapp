import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../home/view/screen_home.dart';
import 'screen_home.dart';

class ScreenPost extends StatelessWidget {
  ScreenPost({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController passwrod = TextEditingController();
  bool isLoading = false;
  postApi(context) async {
    var body = {"email": email.text, "password": passwrod.text};
    String url = 'https://reqres.in/api/register';
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScreenTestHome(),
      ));
      print(response.body);
    } else {
      //show error message when post requst is not sucesses.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('some error is occured ')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'enter email'),
            ),
            TextFormField(
              controller: passwrod,
              decoration: InputDecoration(hintText: 'enter passwrod'),
            ),
            ElevatedButton(
                onPressed: () {
                  postApi(context);
                },
                child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
