// To parse this JSON data, do
//
//     final responseResourceModel = responseResourceModelFromJson(jsonString);

import 'dart:convert';

ResponseResourceModel responseResourceModelFromJson(String str) => ResponseResourceModel.fromJson(json.decode(str));

String responseResourceModelToJson(ResponseResourceModel data) => json.encode(data.toJson());

class ResponseResourceModel {
    int page;
    int perPage;
    int total;
    int totalPages;
    List<Datum> data;
    Support support;

    ResponseResourceModel({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    factory ResponseResourceModel.fromJson(Map<String, dynamic> json) => ResponseResourceModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
    };
}

class Datum {
    int id;
    String name;
    int year;
    String color;
    String pantoneValue;

    Datum({
        required this.id,
        required this.name,
        required this.year,
        required this.color,
        required this.pantoneValue,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
    };
}

class Support {
    String url;
    String text;

    Support({
        required this.url,
        required this.text,
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
