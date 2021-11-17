import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinListRequested extends CoinsEvent {
  String? currency;
  bool? sparkline;
  CoinListRequested({this.currency, this.sparkline});
  @override
  List<Object?> get props => [currency, sparkline];
}
