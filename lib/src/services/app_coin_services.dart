import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../models/coins.dart';
import 'coin_service.dart';

class AppCoinService extends CoinService {
  AppCoinService(http.Client client) : super(client);

  Future<List<Coins>> getCoinsFromAPI(
      {required String currency,
      required int start,
      required int limit,
      required bool sparkline}) async {
    var url = Uri.parse(StringData.FINAL_API_URL +
        '/markets?vs_currency=$currency&order=market_cap_desc&per_page=$limit&page=$start&sparkline=$sparkline');

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
      List<Coins> listCoins = responseData.map((coins) {
        return Coins.fromJson(coins);
      }).toList();
      return listCoins;
    } else {
      throw Exception().toString();
    }
  }
}
