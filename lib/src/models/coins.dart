class Coins {
  String id;
  String name;
  String symbol;
  String image;
  num? currentPrice;
  num? high_24h;
  num? low_24h;
  num? priceChange_24h;
  num? ath;
  num? athChangePercentage;
  String athDate;
  num? atl;
  num? atlChangePercentage;
  String atlDate;
  String lastUpdated;
  List<dynamic> sparklineIn_7d;

  Coins({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.high_24h,
    required this.low_24h,
    required this.priceChange_24h,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.lastUpdated,
    required this.sparklineIn_7d,
  });

  factory Coins.fromJson(Map<String, dynamic> json) {
    return Coins(
      id: json["id"],
      name: json["name"],
      symbol: json['symbol'],
      image: json['image'],
      ath: json['ath'],
      athChangePercentage: json['ath_change_percentage'],
      athDate: json['ath_date'],
      atl: json['atl'],
      atlChangePercentage: json['atl_change_percentage'],
      atlDate: json['atl_date'],
      currentPrice: json['current_price'],
      high_24h: json['high_24h'],
      lastUpdated: json['last_updated'],
      low_24h: json['low_24h'],
      priceChange_24h: json['price_change_24h'],
      sparklineIn_7d: json['sparkline_in_7d']['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'image': image,
      'current_price': currentPrice,
      'high_24h': high_24h,
      'low_24h': low_24h,
      'price_change_24h': priceChange_24h,
      'ath': ath,
      'ath_change_percentage': athChangePercentage,
      'ath_date': athDate,
      'atl': atl,
      'atl_change_percentage': atlChangePercentage,
      'atl_date': atlDate,
      'last_updated': lastUpdated,
      'sparkline_in_7d' 'price': sparklineIn_7d,
    };
  }
}
