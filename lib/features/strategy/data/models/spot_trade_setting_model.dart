// To parse this JSON data, do
//
//     final spotTradeSettingModel = spotTradeSettingModelFromJson(jsonString);

import 'dart:convert';

SpotTradeSettingModel spotTradeSettingModelFromJson(String str) =>
    SpotTradeSettingModel.fromJson(json.decode(str));

String spotTradeSettingModelToJson(SpotTradeSettingModel data) =>
    json.encode(data.toJson());

class SpotTradeSettingModel {
  String message;
  Data data;

  SpotTradeSettingModel({required this.message, required this.data});

  factory SpotTradeSettingModel.fromJson(Map<String, dynamic> json) =>
      SpotTradeSettingModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  String mode;
  String symbols;
  SpotConfig spotConfig;

  Data({required this.mode, required this.symbols, required this.spotConfig});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mode: json["mode"],
    symbols: json["symbols"],
    spotConfig: SpotConfig.fromJson(json["spotConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "symbols": symbols,
    "spotConfig": spotConfig.toJson(),
  };
}

class SpotConfig {
  dynamic rsiDca;
  dynamic rsiEntry;
  List<DcaLevel> dcaLevels;
  dynamic maxDcaCount;
  bool useEmaFilter;
  dynamic initialBuyPercent;
  dynamic takeProfitPercent;
  dynamic trailingStopPercent;

  SpotConfig({
    required this.rsiDca,
    required this.rsiEntry,
    required this.dcaLevels,
    required this.maxDcaCount,
    required this.useEmaFilter,
    required this.initialBuyPercent,
    required this.takeProfitPercent,
    required this.trailingStopPercent,
  });

  factory SpotConfig.fromJson(Map<String, dynamic> json) => SpotConfig(
    rsiDca: json["rsiDca"],
    rsiEntry: json["rsiEntry"],
    dcaLevels: List<DcaLevel>.from(
      json["dcaLevels"].map((x) => DcaLevel.fromJson(x)),
    ),
    maxDcaCount: json["maxDcaCount"],
    useEmaFilter: json["useEmaFilter"],
    initialBuyPercent: json["initialBuyPercent"]?.toDouble(),
    takeProfitPercent: json["takeProfitPercent"]?.toDouble(),
    trailingStopPercent: json["trailingStopPercent"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "rsiDca": rsiDca,
    "rsiEntry": rsiEntry,
    "dcaLevels": List<dynamic>.from(dcaLevels.map((x) => x.toJson())),
    "maxDcaCount": maxDcaCount,
    "useEmaFilter": useEmaFilter,
    "initialBuyPercent": initialBuyPercent,
    "takeProfitPercent": takeProfitPercent,
    "trailingStopPercent": trailingStopPercent,
  };
}

class DcaLevel {
  double priceDrop;
  double capitalPercent;

  DcaLevel({required this.priceDrop, required this.capitalPercent});

  factory DcaLevel.fromJson(Map<String, dynamic> json) => DcaLevel(
    priceDrop: json["priceDrop"]?.toDouble(),
    capitalPercent: json["capitalPercent"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "priceDrop": priceDrop,
    "capitalPercent": capitalPercent,
  };
}
