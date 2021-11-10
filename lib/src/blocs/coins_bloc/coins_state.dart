import 'package:crypto_mobile_application/src/models/coins.dart';
import 'package:equatable/equatable.dart';

abstract class CoinsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CoinsInitial extends CoinsState {}

class CoinsLoadInProgress extends CoinsState {}

class CoinsLoadSuccess extends CoinsState {
  final List<Coins>? listCoins;

  CoinsLoadSuccess({this.listCoins});
}

class CoinsLoadFailure extends CoinsState {
  String? error;

  CoinsLoadFailure({this.error});
}
