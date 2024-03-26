import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/screen/task_1/lead/model/lead_response_model.dart';

import '../../test/model/api_lead_model.dart';
import '../login/compoents/custom_text.dart';
import '../login/view/screen_login.dart';
import '../utils/custom_color.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLead extends StatefulWidget {
  const ScreenLead({super.key});

  @override
  State<ScreenLead> createState() => _ScreenLeadState();
}

class _ScreenLeadState extends State<ScreenLead> {
  Future<LeadResponseLeadModel> leadResponseApi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    final url = 'https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/';
    final response = await http.get(Uri.parse(url), headers: {
    //  'Content-type': 'application/json',
      'authorization': 'token ${token}'
    });
    final responseData = json.decode(response.body);
    var data = LeadResponseLeadModel.fromJson(responseData);
    return data;
  }

  logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    leadResponseApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        // backgroundColor: Color(0xfffdfdfd),
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.sort,
          size: 30,
          color: Colors.black,
        ),
        title: const CustomTextWidget(text: 'Lead List'),
        actions: [
          const Icon(Icons.notifications),
          IconButton(
              onPressed: () {
                logout();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenLogin(),
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
          future: leadResponseApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.data.leads.length,
                itemBuilder: (BuildContext context, int index) {
                  var leadData = snapshot.data!.data.leads[index];
                  print('length === ${snapshot.data!.data.leads.length}');
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 50,
                            child: Card(
                              color: leadListCountColor,
                              child:
                                  Center(child: CustomTextWidget(text: '01')),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextWidget(
                                    fontWeight: FontWeight.bold,
                                    text: leadData.name,
                                    color: nameLeadColor,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextWidget(
                                      text: leadData.email.isNotEmpty
                                          ? leadData.email
                                          : leadData.name),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextWidget(text: 'Created :'),
                                  CustomTextWidget(
                                      text: DateFormat('yyyy-MM-dd')
                                          .format(leadData.createdAt)),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextWidget(text: 'Mobile :'),
                                  CustomTextWidget(text: leadData.mobile),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: leadListInterstColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: 56,
                            height: 30,
                            child: Center(
                              child: CustomTextWidget(
                                text: leadData.interest.name,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          // Icon(Icons.phone),
                          Spacer(),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                  ),
                                  CustomTextWidget(
                                    text: 'location',
                                    fontSize: 12,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.phone_in_talk,
                                size: 25,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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
          }),
    );
  }
}
