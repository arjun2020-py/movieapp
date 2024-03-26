// To parse this JSON data, do
//
//     final LeadResponseLoginModel = LeadResponseLoginModelFromJson(jsonString);

import 'dart:convert';

LeadResponseLoginModel LeadResponseLoginModelFromJson(String str) => LeadResponseLoginModel.fromJson(json.decode(str));

String LeadResponseLoginModelToJson(LeadResponseLoginModel data) => json.encode(data.toJson());

class LeadResponseLoginModel {
    bool success;
    Data data;
    String message;
    dynamic errors;

    LeadResponseLoginModel({
        required this.success,
        required this.data,
        required this.message,
       // required this.errors,
    });

    factory LeadResponseLoginModel.fromJson(Map<String, dynamic> json) => LeadResponseLoginModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
       // errors: json["errors"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        //"errors": errors,
    };
}

class Data {
    int id;
    String role;
    bool isParent;
    bool isPrivacy;
    dynamic lastLogin;
    DateTime createdAt;
    DateTime updatedAt;
    String uuid;
    String firstName;
    dynamic lastName;
    String username;
    String mobile;
    String email;
    dynamic image;
    dynamic otp;
    bool isActive;
    dynamic fkCompany;
    int createdBy;
    int fkRole;
    List<dynamic> groups;
    List<dynamic> userPermissions;
    String token;

    Data({
        required this.id,
        required this.role,
        required this.isParent,
        required this.isPrivacy,
        required this.lastLogin,
        required this.createdAt,
        required this.updatedAt,
        required this.uuid,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.mobile,
        required this.email,
        required this.image,
        required this.otp,
        required this.isActive,
        required this.fkCompany,
        required this.createdBy,
        required this.fkRole,
        required this.groups,
        required this.userPermissions,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        role: json["role"],
        isParent: json["is_parent"],
        isPrivacy: json["is_privacy"],
        lastLogin: json["last_login"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        mobile: json["mobile"],
        email: json["email"],
        image: json["image"],
        otp: json["otp"],
        isActive: json["is_active"],
        fkCompany: json["fk_company"],
        createdBy: json["created_by"],
        fkRole: json["fk_role"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "is_parent": isParent,
        "is_privacy": isPrivacy,
        "last_login": lastLogin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "mobile": mobile,
        "email": email,
        "image": image,
        "otp": otp,
        "is_active": isActive,
        "fk_company": fkCompany,
        "created_by": createdBy,
        "fk_role": fkRole,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
        "token": token,
    };
}
