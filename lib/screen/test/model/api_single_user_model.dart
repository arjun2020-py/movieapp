// To parse this JSON data, do
//
//     final apiSingleuserResponse = apiSingleuserResponseFromJson(jsonString);

import 'dart:convert';

ApiSingleuserResponse apiSingleuserResponseFromJson(String str) =>
    ApiSingleuserResponse.fromJson(json.decode(str));

String apiSingleuserResponseToJson(ApiSingleuserResponse data) =>
    json.encode(data.toJson());

class ApiSingleuserResponse {
  Data? data;
  Support? support;

  ApiSingleuserResponse({
    this.data,
    this.support,
  });

  factory ApiSingleuserResponse.fromJson(Map<String, dynamic> json) =>
      ApiSingleuserResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "support": support?.toJson(),
      };
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
