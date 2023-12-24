import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'router/router.dart';
import 'theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoPro extends StatelessWidget {
  const CryptoPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto PRO',
      theme: darkTheme,
      routes: routes,
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
    );
  }
}