import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetListCoins extends CoinsEvent {
  String? currency;
  bool? sparkline;

  GetListCoins({this.currency, this.sparkline});
}
