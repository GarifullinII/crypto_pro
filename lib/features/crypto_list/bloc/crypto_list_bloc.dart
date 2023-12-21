import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final AbstractCoinsRepository coinsRepository;

  CryptoListBloc(this.coinsRepository) : super(CryptoListInitialState()) {
    on<LoadCryptoListEvent>(load);
  }

  Future<void> load(
      LoadCryptoListEvent event,
      Emitter<CryptoListState> emit,
      ) async {
    try {
      if (state is! CryptoListLoadedState) {
        emit(CryptoListLoadingState());
      }
      final coinsList = await coinsRepository.getCoinsList();
      emit(CryptoListLoadedState(coinsList: coinsList));
    } catch (error) {
      emit(CryptoListLoadingFailureState(exception: error));
    } finally {
      event.completer?.complete();
    }
  }
}