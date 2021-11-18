import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinListRequested extends CoinsEvent {
  final String currency;
  final bool sparkLine;
  CoinListRequested({required this.currency,required this.sparkLine});
  @override
  List<Object?> get props => [currency, sparkLine];
}
