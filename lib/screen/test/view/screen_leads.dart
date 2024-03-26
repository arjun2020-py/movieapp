import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/api_lead_model.dart';

class ScreenLeads extends StatefulWidget {
  const ScreenLeads({super.key});

  @override
  State<ScreenLeads> createState() => _ScreenLeadsState();
}

class _ScreenLeadsState extends State<ScreenLeads> {
  Future<ResponseLeadModel> leadListApi() async {
    final url = 'https://run.mocky.io/v3/53d1d8cd-1f6f-4f1b-b2ec-68c0040e221c';
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final data = ResponseLeadModel.fromJson(responseData);

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    leadListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lead List'),
      ),
      body: FutureBuilder(
          future: leadListApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.data.leads.length,
                  itemBuilder: (context, index) {
                    print(
                        'length is ${snapshot.data!.data.leads.length}===========');
                    var data = snapshot.data!.data.leads[index];
                    return ListTile(
                      tileColor: Colors.amberAccent,
                      leading: Text(data.id.toString()),
                      title: Text(data.email.isNotEmpty ? data.name : 'lead'),
                      subtitle: Text(data.email.isNotEmpty
                          ? data.email
                          : 'lead@gmail.com'),
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
            }
          }),
    );
  }
}
