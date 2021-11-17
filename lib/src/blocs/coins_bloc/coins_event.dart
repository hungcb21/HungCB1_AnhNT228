import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinListRequest extends CoinsEvent {
  String? currency;
  bool? sparkline;
  CoinListRequest({this.currency, this.sparkline});
  @override
  List<Object?> get props => [currency, sparkline];
}
