import 'dart:convert';

class Coins {
  String id;
  String name;
  String symbol;
  String image;
  num? current_price;
  num? high_24h;
  num? low_24h;
  num? price_change_24h;
  num? ath;
  num? ath_change_percentage;
  String ath_date;
  num? atl;
  num? atl_change_percentage;
  String atl_date;
  String last_updated;
  List<dynamic> sparkline_in_7d;

  Coins({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.current_price,
    required this.high_24h,
    required this.low_24h,
    required this.price_change_24h,
    required this.ath,
    required this.ath_change_percentage,
    required this.ath_date,
    required this.atl,
    required this.atl_change_percentage,
    required this.atl_date,
    required this.last_updated,
    required this.sparkline_in_7d,
  });

  factory Coins.fromJson(Map<String, dynamic> json) {
    return Coins(
      id: json["id"],
      name: json["name"],
      symbol: json['symbol'],
      image: json['image'],
      ath: json['ath'],
      ath_change_percentage: json['ath_change_percentage'],
      ath_date: json['ath_date'],
      atl: json['atl'],
      atl_change_percentage: json['atl_change_percentage'],
      atl_date: json['atl_date'],
      current_price: json['current_price'],
      high_24h: json['high_24h'],
      last_updated: json['last_updated'],
      low_24h: json['low_24h'],
      price_change_24h: json['price_change_24h'],
      sparkline_in_7d: json['sparkline_in_7d']['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'image': image,
      'current_price': current_price,
      'high_24h': high_24h,
      'low_24h': low_24h,
      'price_change_24h': price_change_24h,
      'ath': ath,
      'ath_change_percentage': ath_change_percentage,
      'ath_date': ath_date,
      'atl': atl,
      'atl_change_percentage': atl_change_percentage,
      'atl_date': atl_date,
      'last_updated': last_updated,
      'sparkline_in_7d''price': sparkline_in_7d,
    };
  }

}
