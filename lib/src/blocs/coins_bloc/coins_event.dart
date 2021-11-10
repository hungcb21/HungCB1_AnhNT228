import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchListCoins extends CoinsEvent {
  String? currency;
  bool? sparkline;

  FetchListCoins({ this.currency, this.sparkline});
}