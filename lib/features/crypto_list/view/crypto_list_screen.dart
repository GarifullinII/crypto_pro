import 'package:crypto_pro/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CryptoPro',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoadedState) {
            return ListView.separated(
              separatorBuilder: (context, i) => const Divider(),
              itemCount: state.coinsList.length,
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
