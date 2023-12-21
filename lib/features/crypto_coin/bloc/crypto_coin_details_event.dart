part of 'crypto_coin_details_bloc.dart';

@immutable
abstract class CryptoCoinDetailsEvent extends Equatable {
  const CryptoCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetailsEvent extends CryptoCoinDetailsEvent {
  final String currencyCode;

  const LoadCryptoCoinDetailsEvent({required this.currencyCode});

  @override
  List<Object> get props => super.props..add(currencyCode);
}