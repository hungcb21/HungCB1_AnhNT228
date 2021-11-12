import 'dart:convert';
<<<<<<< HEAD

=======
import 'package:crypto_mobile_application/src/config/app_config.dart';
import 'package:crypto_mobile_application/src/config/constants.dart';
>>>>>>> d7691a0b76393fa8aa554897e15d40fda56dc4ac
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
    var url = Uri.parse(AppConfig.instance.getValue(AppConstants.HOST_NAME) +
        AppConfig.instance.getValue(AppConstants.COIN_PATH) +
        AppConfig.instance.getValue(AppConstants.MARKET_PATH) +
        AppConfig.instance.getValue(AppConstants.CURRENCY) +
        '$currency' +
        AppConfig.instance.getValue(AppConstants.ORDER) +
        AppConfig.instance.getValue(AppConstants.LIMIT) +
        '$limit' +
        AppConfig.instance.getValue(AppConstants.START) +
        '$start' +
        AppConfig.instance.getValue(AppConstants.SPARKLINE) +
        '$sparkline');
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
