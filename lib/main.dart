import 'package:crypto_pro/router/router.dart';
import 'package:crypto_pro/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoPro());
}

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
