import 'package:crypto_pro/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoPro extends StatefulWidget {
  const CryptoPro({super.key});

  @override
  State<CryptoPro> createState() => _CryptoProState();
}

class _CryptoProState extends State<CryptoPro> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto PRO',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}