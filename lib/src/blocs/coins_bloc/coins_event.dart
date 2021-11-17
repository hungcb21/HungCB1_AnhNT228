import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinListRequested extends CoinsEvent {
  String? currency;
  bool? sparkLine;
  CoinListRequested({this.currency, this.sparkLine});
  @override
  List<Object?> get props => [currency, sparkLine];
}
