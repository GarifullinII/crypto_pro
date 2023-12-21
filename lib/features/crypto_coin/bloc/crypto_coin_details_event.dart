part of 'crypto_coin_details_bloc.dart';

@immutable
abstract class CryptoCoinDetailsEvent {}

class LoadCryptoCoinDetailsEvent extends CryptoCoinDetailsEvent {
  final String currencyCode;

  LoadCryptoCoinDetailsEvent({required this.currencyCode});
}