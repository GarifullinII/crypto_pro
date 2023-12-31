part of 'crypto_coin_details_bloc.dart';

@immutable
abstract class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object?> get props => [];

}

class CryptoCoinDetailsInitialState extends CryptoCoinDetailsState {
  const CryptoCoinDetailsInitialState();

  @override
  List<Object> get props => [];
}

class CryptoCoinDetailsLoadingState extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoadingState();

  @override
  List<Object> get props => [];
}

class CryptoCoinDetailsLoadedState extends CryptoCoinDetailsState {
  final CryptoCoin coin;

  const CryptoCoinDetailsLoadedState(this.coin);

  @override
  List<Object> get props => [coin];
}

class CryptoCoinDetailsLoadingFailureState extends CryptoCoinDetailsState {
  final Object exception;

  const CryptoCoinDetailsLoadingFailureState(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}