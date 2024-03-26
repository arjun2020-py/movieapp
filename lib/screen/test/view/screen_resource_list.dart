import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/api_resource_list.dart';
import 'package:http/http.dart' as http;

class ScreenListResource extends StatefulWidget {
  const ScreenListResource({super.key});

  @override
  State<ScreenListResource> createState() => _ScreenListResourceState();
}

class _ScreenListResourceState extends State<ScreenListResource> {
  Future<ResponseResourceModel> resourceListApi() async {
    final url = 'https://reqres.in/api/unknown';

    final response = await http.get(Uri.parse(url));

    final responseData = json.decode(response.body);

    final data = ResponseResourceModel.fromJson(responseData);
    return data;
  }

  @override
  void initState() {
    resourceListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Resource List'),
      ),
      body: FutureBuilder(
          future: resourceListApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.blue,
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.data[index];
                  //split '#' value  from "0xff" using replaceAll function
                  return Card(
                    color: Color(int.parse(data.color.replaceAll('#', "0xff"))),
                    child: ListTile(
                      leading: Text(data.id.toString()),
                      title: Text(data.name),
                      subtitle: Text(data.year.toString()),
                    ),
                  );
                },
              );
            } else {
              return Text(snapshot.error.toString());
            }
          }),
    );
  }
}
