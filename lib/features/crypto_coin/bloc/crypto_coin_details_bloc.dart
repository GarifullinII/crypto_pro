import 'package:bloc/bloc.dart';
import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinsRepository coinsRepository;

  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(CryptoCoinDetailsInitialState()) {
    on<LoadCryptoCoinDetailsEvent>(load);
  }

  Future<void> load(
    LoadCryptoCoinDetailsEvent event,
    Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoadedState) {
        emit(CryptoCoinDetailsLoadingState());
      }
      final coinDetails =
          await coinsRepository.getCoinDetails(event.currencyCode);
      emit(CryptoCoinDetailsLoadedState(coinDetails));
    } catch (error, sr) {
      emit(CryptoCoinDetailsLoadingFailureState(error));
      GetIt.I<Talker>().handle(error, sr);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
