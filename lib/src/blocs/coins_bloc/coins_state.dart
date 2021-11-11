import '../../models/coins.dart';
import 'package:equatable/equatable.dart';

abstract class CoinsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinsInitial extends CoinsState {}

class CoinsLoadInProgress extends CoinsState {}

class CoinsLoadSuccess extends CoinsState {
  final List<Coins>? listCoins;

  CoinsLoadSuccess({this.listCoins});
  @override
  // TODO: implement props
  List<Object?> get props => [listCoins];
}

class CoinsLoadFailure extends CoinsState {
  String? error;
  CoinsLoadFailure({this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
