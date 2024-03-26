import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/api_dog_reponse.dart';
import '../model/api_single_user_model.dart';

class ScreenTest extends StatefulWidget {
  const ScreenTest({super.key});

  @override
  State<ScreenTest> createState() => _ScreenTestState();
}

class _ScreenTestState extends State<ScreenTest> {
 

  Future<ApiSingleuserResponse> fetchSingleUser() async {
    String url = 'https://reqres.in/api/users/2';
    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body);
    final data = ApiSingleuserResponse.fromJson(responseData);

    return data;
  }



  @override
  void initState() {
    // TODO: implement initState
    
    fetchSingleUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Dog App'),
        ),
        body: FutureBuilder(
          future: fetchSingleUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data!.data;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data!.avatar.toString()),
                ),
                title: Text(data.firstName.toString()),
                subtitle: Text(data.lastName.toString()),
                trailing: Text(data.email.toString()),
              );
            } else {
              return Text(snapshot.error.toString());
            }
          },
        )
        // FutureBuilder(
        //   future: fetchDogData(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (snapshot.hasData) {
        //       var data = snapshot.data;
        //       return Center(
        //         child: Image.network(data!.message.toString()),
        //       );
        //     } else {
        //       return Text(snapshot.error.toString());
        //     }
        //   },
        // )
        );
  }
}
