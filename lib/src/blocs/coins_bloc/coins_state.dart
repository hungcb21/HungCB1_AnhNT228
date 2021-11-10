
import 'package:crypto_mobile_application/src/models/coins.dart';
import 'package:equatable/equatable.dart';

abstract class CoinsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListCoinsEmpty extends CoinsState {}

class ListCoinsLoading extends CoinsState {}

class ListCoinsLoaded extends CoinsState {
  final List<Coins>? listCoins;
  ListCoinsLoaded({this.listCoins});

}

class ListCoinsLoadFail extends CoinsState {
  String? error;

  ListCoinsLoadFail({this.error});
}
