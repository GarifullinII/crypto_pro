import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
    } catch (error, sr) {
      emit(CryptoListLoadingFailureState(exception: error));
      GetIt.I<Talker>().handle(error, sr);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}