// To parse this JSON data, do
//
//     final affiliateUserDetail = affiliateUserDetailFromJson(jsonString);

import 'dart:convert';

AffiliateUserDetailModel affiliateUserDetailFromJson(String str) =>
    AffiliateUserDetailModel.fromJson(json.decode(str));

String affiliateUserDetailToJson(AffiliateUserDetailModel data) =>
    json.encode(data.toJson());

class AffiliateUserDetailModel {
  bool success;
  List<List<Datum>> data;

  AffiliateUserDetailModel({required this.success, required this.data});

  factory AffiliateUserDetailModel.fromJson(Map<String, dynamic> json) =>
      AffiliateUserDetailModel(
        success: json["success"],
        data: List<List<Datum>>.from(
          json["data"].map(
            (x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(
      data.map((x) => List<dynamic>.from(x.map((x) => x.toJson()))),
    ),
  };
}

class Datum {
  String node;
  String uinst;
  String rank;
  bool isActive;
  bool isStop;
  double myBusiness;
  String myQty;
  String directs;
  bool validator;

  Datum({
    required this.node,
    required this.uinst,
    required this.rank,
    required this.isActive,
    required this.isStop,
    required this.myBusiness,
    required this.myQty,
    required this.directs,
    required this.validator,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    node: json["node"],
    uinst: json["uinst"],
    rank: json["rank"],
    isActive: json["isActive"],
    isStop: json["isStop"],
    myBusiness: json["myBusiness"]?.toDouble(),
    myQty: json["myQty"],
    directs: json["directs"],
    validator: json["validator"],
  );

  Map<String, dynamic> toJson() => {
    "node": node,
    "uinst": uinst,
    "rank": rank,
    "isActive": isActive,
    "isStop": isStop,
    "myBusiness": myBusiness,
    "myQty": myQty,
    "directs": directs,
    "validator": validator,
  };
}
