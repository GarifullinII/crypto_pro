import 'package:flutter/material.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class CryptoPro extends StatelessWidget {
  const CryptoPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto PRO',
      theme: darkTheme,
      routes: routes,
    );
  }
}