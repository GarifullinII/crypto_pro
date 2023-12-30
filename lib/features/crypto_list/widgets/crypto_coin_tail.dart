import 'package:auto_route/auto_route.dart';
import 'package:crypto_pro/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_pro/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_pro/router/router.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetail = coin.detail;

    return ListTile(
      leading: Image.network(
        coinDetail.fullImageUrl,
        height: 32,
        width: 32,
      ),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${(coinDetail.priceInUSD*10000).round()/10000} \$',
        style: theme.textTheme.bodySmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
      },
    );
  }
}