part of 'crypto_coin_details_bloc.dart';

@immutable
abstract class CryptoCoinDetailsState {}

class CryptoCoinDetailsInitialState extends CryptoCoinDetailsState {}

class CryptoCoinDetailsLoadingState extends CryptoCoinDetailsState {}

class CryptoCoinDetailsLoadedState extends CryptoCoinDetailsState {
  final CryptoCoinDetail coinDetails;

  CryptoCoinDetailsLoadedState(this.coinDetails);
}

class CryptoCoinDetailsLoadingFailureState extends CryptoCoinDetailsState {
  final Object exception;

  CryptoCoinDetailsLoadingFailureState(this.exception);
}