// To parse this JSON data, do
//
//     final runningBotModel = runningBotModelFromJson(jsonString);

import 'dart:convert';

RunningBotModel runningBotModelFromJson(String str) =>
    RunningBotModel.fromJson(json.decode(str));

String runningBotModelToJson(RunningBotModel data) =>
    json.encode(data.toJson());

class RunningBotModel {
  String success;
  List<RunningBotList> data;
  //int status;

  RunningBotModel({
    required this.success,
    required this.data,
    // required this.status,
  });

  factory RunningBotModel.fromJson(Map<String, dynamic> json) =>
      RunningBotModel(
        success: json["message"],
        data: List<RunningBotList>.from(json["data"].map((x) => RunningBotList.fromJson(x))),
        //status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "message": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    //"status": status,
  };
}

class RunningBotList {
  String userid;
  String dockerId;
  String symbol;
  Payload payload;
  Payload payloadlive;
  DateTime createdAt;
  bool isActive;

  RunningBotList({
    required this.userid,
    required this.dockerId,
    required this.symbol,
    required this.payload,
    required this.payloadlive,
    required this.createdAt,
    required this.isActive,
  });

  factory RunningBotList.fromJson(Map<String, dynamic> json) => RunningBotList(
    userid: json["userid"],
    dockerId: json["docker_id"],
    symbol: json["symbol"],
    payload: Payload.fromJson(json["payload"]),
    payloadlive: Payload.fromJson(json["payloadlive"]),
    createdAt: DateTime.parse(json["created_at"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "docker_id": dockerId,
    "symbol": symbol,
    "payload": payload.toJson(),
    "payloadlive": payloadlive.toJson(),
    "created_at": createdAt.toIso8601String(),
    "is_active": isActive,
  };
}

class Payload {
  String mode;
  String symbols;
  SpotConfig spotConfig;
  //FuturesConfig futuresConfig;

  Payload({
    required this.mode,
    required this.symbols,
    required this.spotConfig,
    // required this.futuresConfig,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    mode: json["mode"],
    symbols: json["symbols"],
    spotConfig: SpotConfig.fromJson(json["spotConfig"]),
    // futuresConfig: FuturesConfig.fromJson(json["futuresConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "symbols": symbols,
    "spotConfig": spotConfig.toJson(),
    //"futuresConfig": futuresConfig.toJson(),
  };
}

class FuturesConfig {
  int leverage;
  double riskPerTrade;
  int atrMultiplier;

  FuturesConfig({
    required this.leverage,
    required this.riskPerTrade,
    required this.atrMultiplier,
  });

  factory FuturesConfig.fromJson(Map<String, dynamic> json) => FuturesConfig(
    leverage: json["leverage"],
    riskPerTrade: json["riskPerTrade"]?.toDouble(),
    atrMultiplier: json["atrMultiplier"],
  );

  Map<String, dynamic> toJson() => {
    "leverage": leverage,
    "riskPerTrade": riskPerTrade,
    "atrMultiplier": atrMultiplier,
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
