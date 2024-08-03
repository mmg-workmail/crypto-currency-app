// To parse this JSON data, do
//
//     final cryptoCurrency = cryptoCurrencyFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

CryptoCurrency cryptoCurrencyFromJson(String str) =>
    CryptoCurrency.fromJson(json.decode(str));

String cryptoCurrencyToJson(CryptoCurrency data) => json.encode(data.toJson());

class CryptoCurrency {
  Data data;
  Status status;

  CryptoCurrency({
    required this.data,
    required this.status,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => CryptoCurrency(
        data: Data.fromJson(json["data"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status.toJson(),
      };
}

class Data {
  List<CryptoCurrencyList> cryptoCurrencyList;
  String totalCount;

  Data({
    required this.cryptoCurrencyList,
    required this.totalCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cryptoCurrencyList: List<CryptoCurrencyList>.from(
            json["cryptoCurrencyList"]
                .map((x) => CryptoCurrencyList.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "cryptoCurrencyList":
            List<dynamic>.from(cryptoCurrencyList.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class CryptoCurrencyList {
  int id;
  String name;
  String symbol;
  // String slug;
  // int cmcRank;
  // int marketPairCount;
  // double circulatingSupply;
  // num selfReportedCirculatingSupply;
  // num totalSupply;
  // num? maxSupply;
  // double ath;
  // double atl;
  // double high24H;
  // double low24H;
  // int isActive;
  // DateTime lastUpdated;
  // DateTime dateAdded;
  List<Quote> quotes;
  // bool isAudited;
  // // List<dynamic> auditInfoList;
  // List<int> badges;

  CryptoCurrencyList({
    required this.id,
    required this.name,
    required this.symbol,
    // required this.slug,
    // required this.cmcRank,
    // required this.marketPairCount,
    // required this.circulatingSupply,
    // required this.selfReportedCirculatingSupply,
    // required this.totalSupply,
    // required this.maxSupply,
    // required this.ath,
    // required this.atl,
    // required this.high24H,
    // required this.low24H,
    // required this.isActive,
    // required this.lastUpdated,
    // required this.dateAdded,
    required this.quotes,
    // required this.isAudited,
    // // required this.auditInfoList,
    // required this.badges,
  });

  factory CryptoCurrencyList.fromJson(Map<String, dynamic> json) =>
      CryptoCurrencyList(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        // slug: json["slug"],
        // cmcRank: json["cmcRank"],
        // marketPairCount: json["marketPairCount"],
        // circulatingSupply: json["circulatingSupply"],
        // selfReportedCirculatingSupply: json["selfReportedCirculatingSupply"],
        // totalSupply: json["totalSupply"],
        // maxSupply: json["maxSupply"],
        // ath: json["ath"]?.toDouble(),
        // atl: json["atl"]?.toDouble(),
        // high24H: json["high24h"]?.toDouble(),
        // low24H: json["low24h"]?.toDouble(),
        // isActive: json["isActive"],
        // lastUpdated: DateTime.parse(json["lastUpdated"]),
        // dateAdded: DateTime.parse(json["dateAdded"]),
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
        // isAudited: json["isAudited"],
        // // auditInfoList: List<dynamic>.from(json["auditInfoList"].map((x) => x)),
        // badges: List<int>.from(json["badges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        // "slug": slug,
        // "cmcRank": cmcRank,
        // "marketPairCount": marketPairCount,
        // "circulatingSupply": circulatingSupply,
        // "selfReportedCirculatingSupply": selfReportedCirculatingSupply,
        // "totalSupply": totalSupply,
        // "maxSupply": maxSupply,
        // "ath": ath,
        // "atl": atl,
        // "high24h": high24H,
        // "low24h": low24H,
        // "isActive": isActive,
        // "lastUpdated": lastUpdated.toIso8601String(),
        // "dateAdded": dateAdded.toIso8601String(),
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
        // "isAudited": isAudited,
        // // "auditInfoList": List<dynamic>.from(auditInfoList.map((x) => x)),
        // "badges": List<dynamic>.from(badges.map((x) => x)),
      };
}

class Quote {
  // String name;
  double price;
  double volume24H;
  double volume7D;
  double volume30D;
  // double marketCap;
  // num selfReportedMarketCap;
  num percentChange1H;
  num percentChange24H;
  num percentChange7D;
  // DateTime lastUpdated;
  // double percentChange30D;
  // double percentChange60D;
  // double percentChange90D;
  // double fullyDilluttedMarketCap;
  // double marketCapByTotalSupply;
  // double dominance;
  // double turnover;
  // double ytdPriceChangePercentage;
  // double percentChange1Y;

  Quote({
    // required this.name,
    required this.price,
    required this.volume24H,
    required this.volume7D,
    required this.volume30D,
    // required this.marketCap,
    // required this.selfReportedMarketCap,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    // required this.lastUpdated,
    // required this.percentChange30D,
    // required this.percentChange60D,
    // required this.percentChange90D,
    // required this.fullyDilluttedMarketCap,
    // required this.marketCapByTotalSupply,
    // required this.dominance,
    // required this.turnover,
    // required this.ytdPriceChangePercentage,
    // required this.percentChange1Y,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        // name: json["name"],
        price: json["price"]?.toDouble(),
        volume24H: json["volume24h"]?.toDouble(),
        volume7D: json["volume7d"]?.toDouble(),
        volume30D: json["volume30d"]?.toDouble(),
        // marketCap: json["marketCap"]?.toDouble(),
        // selfReportedMarketCap: json["selfReportedMarketCap"],
        percentChange1H: json["percentChange1h"]?.toDouble(),
        percentChange24H: json["percentChange24h"]?.toDouble(),
        percentChange7D: json["percentChange7d"]?.toDouble(),
        // lastUpdated: DateTime.parse(json["lastUpdated"]),
        // percentChange30D: json["percentChange30d"]?.toDouble(),
        // percentChange60D: json["percentChange60d"]?.toDouble(),
        // percentChange90D: json["percentChange90d"]?.toDouble(),
        // fullyDilluttedMarketCap: json["fullyDilluttedMarketCap"]?.toDouble(),
        // marketCapByTotalSupply: json["marketCapByTotalSupply"]?.toDouble(),
        // dominance: json["dominance"]?.toDouble(),
        // turnover: json["turnover"]?.toDouble(),
        // ytdPriceChangePercentage: json["ytdPriceChangePercentage"]?.toDouble(),
        // percentChange1Y: json["percentChange1y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        // "name": name,
        "price": price,
        "volume24h": volume24H,
        "volume7d": volume7D,
        "volume30d": volume30D,
        // "marketCap": marketCap,
        // "selfReportedMarketCap": selfReportedMarketCap,
        "percentChange1h": percentChange1H,
        "percentChange24h": percentChange24H,
        "percentChange7d": percentChange7D,
        // "lastUpdated": lastUpdated.toIso8601String(),
        // "percentChange30d": percentChange30D,
        // "percentChange60d": percentChange60D,
        // "percentChange90d": percentChange90D,
        // "fullyDilluttedMarketCap": fullyDilluttedMarketCap,
        // "marketCapByTotalSupply": marketCapByTotalSupply,
        // "dominance": dominance,
        // "turnover": turnover,
        // "ytdPriceChangePercentage": ytdPriceChangePercentage,
        // "percentChange1y": percentChange1Y,
      };
}

class Status {
  DateTime timestamp;
  String errorCode;
  String errorMessage;
  String elapsed;
  int creditCount;

  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
      };
}
