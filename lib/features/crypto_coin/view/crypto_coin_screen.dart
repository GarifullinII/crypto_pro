import 'package:crypto_pro/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
  });

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;

  final _cryptoCoinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(
      arg != null && arg is CryptoCoin,
      'Необходимо передать данные типа String',
    );
    coin = arg as CryptoCoin;
    _cryptoCoinDetailsBloc
        .add(LoadCryptoCoinDetailsEvent(currencyCode: coin!.name));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coin!.name,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
          bloc: _cryptoCoinDetailsBloc,
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoadedState) {
              final coinDetails = state.coinDetails;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    coinDetails.name,
                    height: 32,
                    width: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(coinDetails.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Text(
                        '${((coinDetails.priceInUSD * 10000).round() / 10000).toString()} \$'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hight 24 Hour:'),
                          Text('Low 24 Hour:'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          children: [
                            Text('${coinDetails.high24Hour} \$'),
                            Text('${coinDetails.low24Hour} \$'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
