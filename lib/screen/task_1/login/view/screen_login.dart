import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../test/model/api_login_response.dart';
import '../../constents.dart';
import '../../lead/screen_lead.dart';
import '../../utils/localStorage/local_storage.dart';
import '../compoents/custom_text.dart';
import '../compoents/custom_text_filed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/login_response_model.dart';


class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  TextEditingController usernameController = TextEditingController(),
      passwordControler = TextEditingController();

  LeadResponseLoginModel? responseLoginModel;
  loginApi(BuildContext context) async {
    print('---------------------p1');
    var body = {
      "username": usernameController.text.trim(),
      "password": passwordControler.text.trim()
    };

    String url = 'https://crm-beta-api.vozlead.in/api/v2/account/login/';
    final response = await http.post(Uri.parse(url), body: body);
    var responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      
      responseLoginModel = LeadResponseLoginModel.fromJson(responseData);
      token = responseLoginModel!.data.token;
      final data = LocalStorage();
      data.setStringData(token!);

  

      print('token ${token}');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ScreenLead(),
      ));
      //print(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: responseData['success'] ? Colors.green : Colors.red,
          content: Text(responseData['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.45,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(120)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/login.jpeg')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Container(
                  child: Form(
                    // key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const CustomTextWidget(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          text: 'Sign In',
                          color: Color(0xff4367c2),
                        ),
                        const CustomTextWidget(
                            color: Colors.black,
                            text:
                                'welcome back! Please enter your credentials to login'),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextformFiledWidget(
                          controller: usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter vaild emailid';
                            }
                          },
                          // controller: cubit.usernameController,
                          hintText: 'User name',
                          obText: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextformFiledWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter vaild paswwrod';
                            }
                          },
                          controller: passwordControler,
                          hintText: 'Password',
                          obText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextWidget(
                                text: 'Forgot you',
                                color: Colors.black.withOpacity(0.4),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const CustomTextWidget(
                                text: 'Password?',
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: ElevatedButton(
                              onPressed: () {
                                loginApi(context);
                              },
                              child: const CustomTextWidget(
                                text: 'Sigin In',
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  backgroundColor: const Color(0xff0f1446))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 110, top: 10),
                          child: Container(
                            child: Row(
                              children: [
                                CustomTextWidget(
                                  text: "Don't have any account?",
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                CustomTextWidget(
                                  fontWeight: FontWeight.bold,
                                  text: 'Siginup',
                                  color: Color(0xff45639d),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
