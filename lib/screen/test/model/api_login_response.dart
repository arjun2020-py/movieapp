// To parse this JSON data, do
//
//     final responseLoginModel = responseLoginModelFromJson(jsonString);

import 'dart:convert';

ResponseLoginModel responseLoginModelFromJson(String str) => ResponseLoginModel.fromJson(json.decode(str));

String responseLoginModelToJson(ResponseLoginModel data) => json.encode(data.toJson());

class ResponseLoginModel {
    int id;
    String token;

    ResponseLoginModel({
        required this.id,
        required this.token,
    });

    factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => ResponseLoginModel(
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
    };
}
