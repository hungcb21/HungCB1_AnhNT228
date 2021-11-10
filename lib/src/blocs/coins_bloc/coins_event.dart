import 'package:equatable/equatable.dart';

abstract class CoinsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CoinsGetListCoin extends CoinsEvent {
  String? currency;
  bool? sparkline;


  CoinsGetListCoin({ this.currency, this.sparkline});
}



