// To parse this JSON data, do
//
//     final userHeldNfTsModel = userHeldNfTsModelFromJson(jsonString);

import 'dart:convert';

UserHeldNfTsModel userHeldNfTsModelFromJson(String str) =>
    UserHeldNfTsModel.fromJson(json.decode(str));

String userHeldNfTsModelToJson(UserHeldNfTsModel data) =>
    json.encode(data.toJson());

class UserHeldNfTsModel {
  bool success;
  List<List<Datum>> data;

  UserHeldNfTsModel({required this.success, required this.data});

  factory UserHeldNfTsModel.fromJson(Map<String, dynamic> json) =>
      UserHeldNfTsModel(
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
  String orc1155;
  String tokenId;
  int balance;

  Datum({
    required this.node,
    required this.orc1155,
    required this.tokenId,
    required this.balance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    node: json["node"],
    orc1155: json["orc1155"],
    tokenId: json["tokenId"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "node": node,
    "orc1155": orc1155,
    "tokenId": tokenId,
    "balance": balance,
  };
}
