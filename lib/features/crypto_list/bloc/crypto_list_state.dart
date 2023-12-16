part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListState {}

class CryptoListInitialState extends CryptoListState {}

class CryptoListLoadingState extends CryptoListState{}

class CryptoListLoadedState extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryptoListLoadedState({required this.coinsList});
}

class CryptoListLoadingFailureState extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailureState({required this.exception});
}
