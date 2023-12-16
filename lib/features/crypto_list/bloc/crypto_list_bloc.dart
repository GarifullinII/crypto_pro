import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final AbstractCoinsRepository coinsRepository;

  CryptoListBloc(this.coinsRepository) : super(CryptoListInitialState()) {
    on<LoadCryptoListEvent>((event, emit) async {
      final coinsList = await coinsRepository.getCoinsList();
      emit(CryptoListLoadedState(coinsList: coinsList));
    });
  }
}
