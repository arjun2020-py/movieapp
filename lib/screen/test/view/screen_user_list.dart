import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/api_user_list_model.dart';
import 'dart:convert';

class ScreenUserList extends StatefulWidget {
  const ScreenUserList({super.key});

  @override
  State<ScreenUserList> createState() => _ScreenUserListState();
}

class _ScreenUserListState extends State<ScreenUserList> {
  Future<ApiuserListResponse> userListApi() async {
    final url = 'https://reqres.in/api/users?page=2';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {}
    final responseData = jsonDecode(response.body);
    final data = ApiuserListResponse.fromJson(responseData);

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: FutureBuilder(
        future: userListApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!.data;
            return ListView.separated(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.data![index];
                return ListTile(
                  tileColor: Colors.red.shade50,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatar.toString()),
                  ),
                  title: Text(data.firstName.toString()),
                  subtitle: Text(data.lastName.toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.transparent,
                );
              },
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}
