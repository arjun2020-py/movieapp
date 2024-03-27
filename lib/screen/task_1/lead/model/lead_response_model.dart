// To parse this JSON data, do
//
//     final LeadResponseLeadModel = LeadResponseLeadModelFromJson(jsonString);

import 'dart:convert';

LeadResponseLeadModel LeadResponseLeadModelFromJson(String str) => LeadResponseLeadModel.fromJson(json.decode(str));

String LeadResponseLeadModelToJson(LeadResponseLeadModel data) => json.encode(data.toJson());

class LeadResponseLeadModel {
    bool success;
    Data data;
    String message;
    dynamic errors;

    LeadResponseLeadModel({
        required this.success,
        required this.data,
        required this.message,
        required this.errors,
    });

    factory LeadResponseLeadModel.fromJson(Map<String, dynamic> json) => LeadResponseLeadModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "errors": errors,
    };
}

class Data {
    List<Lead> leads;
    int totalCount;
    int totalPage;
    int nextPageNo;
    dynamic previousPageNo;
    int currentPage;

    Data({
        required this.leads,
        required this.totalCount,
        required this.totalPage,
        required this.nextPageNo,
        required this.previousPageNo,
        required this.currentPage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        leads: List<Lead>.from(json["leads"].map((x) => Lead.fromJson(x))),
        totalCount: json["total_count"],
        totalPage: json["total_page"],
        nextPageNo: json["next_page_no"],
        previousPageNo: json["previous_page_no"],
        currentPage: json["current_page"],
    );

    Map<String, dynamic> toJson() => {
        "leads": List<dynamic>.from(leads.map((x) => x.toJson())),
        "total_count": totalCount,
        "total_page": totalPage,
        "next_page_no": nextPageNo,
        "previous_page_no": previousPageNo,
        "current_page": currentPage,
    };
}

class Lead {
    int id;
    //Source? source;
    CreatedUser createdUser;
    String? assignedUser;
    DateTime createdAt;
    DateTime updatedAt;
    String name;
    String mobile;
    String email;
    dynamic image;
   // Interest interest;
   // Location? location;
    bool isAssigned;
    Status status;
    Priority priority;
    String? subSource;
    int fkCompany;
    int createdBy;

    Lead({
        required this.id,
      //  required this.source,
        required this.createdUser,
        required this.assignedUser,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.mobile,
        required this.email,
        required this.image,
      //  required this.interest,
     //   required this.location,
        required this.isAssigned,
        required this.status,
        required this.priority,
        required this.subSource,
        required this.fkCompany,
        required this.createdBy,
    });

    factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json["id"],
     //   source: sourceValues.map[json["source"]]!,
        createdUser: createdUserValues.map[json["created_user"]]!,
        assignedUser: json["assigned_user"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        image: json["image"],
       // interest: interestValues.map[json["interest"]]!,
     //   location: locationValues.map[json["location"]]!,
        isAssigned: json["is_assigned"],
        status: statusValues.map[json["status"]]!,
        priority: priorityValues.map[json["priority"]]!,
        subSource: json["sub_source"],
        fkCompany: json["fk_company"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
      //  "source": sourceValues.reverse[source],
        "created_user": createdUserValues.reverse[createdUser],
        "assigned_user": assignedUser,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "mobile": mobile,
        "email": email,
        "image": image,
       // "interest": interestValues.reverse[interest],
     //   "location": locationValues.reverse[location],
        "is_assigned": isAssigned,
        "status": statusValues.reverse[status],
        "priority": priorityValues.reverse[priority],
        "sub_source": subSource,
        "fk_company": fkCompany,
        "created_by": createdBy,
    };
}

enum CreatedUser {
    AJMAL,
    CODEME,
    IRFAN
}

final createdUserValues = EnumValues({
    "Ajmal": CreatedUser.AJMAL,
    "codeme": CreatedUser.CODEME,
    "irfan": CreatedUser.IRFAN
});

enum Interest {
    DS,
    EMPTY,
    FLUTTER,
    INTEREST_UI,
    SAMPLE,
    SAMPLE_INTEREST,
    UI
}

final interestValues = EnumValues({
    "DS": Interest.DS,
    "": Interest.EMPTY,
    "flutter": Interest.FLUTTER,
    "ui": Interest.INTEREST_UI,
    "sample": Interest.SAMPLE,
    "Sample interest": Interest.SAMPLE_INTEREST,
    "UI": Interest.UI
});

enum Location {
    CALICUT,
    EMPTY,
    LOCATION_CALICUT,
    NEMMARA,
    THRISSUR,
    WAYANAD
}

final locationValues = EnumValues({
    "Calicut": Location.CALICUT,
    "": Location.EMPTY,
    "calicut": Location.LOCATION_CALICUT,
    "nemmara": Location.NEMMARA,
    "thrissur": Location.THRISSUR,
    "wayanad": Location.WAYANAD
});

enum Priority {
    HOT,
    WARM
}

final priorityValues = EnumValues({
    "Hot": Priority.HOT,
    "Warm": Priority.WARM
});

enum Source {
    CALL,
    OTHER,
    WEBSITE
}

final sourceValues = EnumValues({
    "Call": Source.CALL,
    "Other": Source.OTHER,
    "Website": Source.WEBSITE
});

enum Status {
    CLOSED,
    NEW,
    OPEN,
    PAUSED,
    REJECTED,
    UNAVAILABLE
}

final statusValues = EnumValues({
    "Closed": Status.CLOSED,
    "New": Status.NEW,
    "Open": Status.OPEN,
    "Paused": Status.PAUSED,
    "Rejected": Status.REJECTED,
    "Unavailable": Status.UNAVAILABLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
