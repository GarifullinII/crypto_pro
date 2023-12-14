import 'package:flutter/material.dart';
import 'features/crypto_list/crypto_list.dart';

void main() {
  runApp(const CryptoPro());
}

class CryptoPro extends StatelessWidget {
  const CryptoPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto PRO',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.white10,
        dividerColor: Colors.white10,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        primarySwatch: Colors.amber,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is String, 'Необходимо передать данные типа String');
    // if (arg == null) {
    //   log('Необходимо передать данные');
    //   return;
    // }
    // if (arg is! String) {
    //   log('Необходимо передать данные типа String');
    //   return;
    // }
    coinName = arg as String;

    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinName ?? '...',
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
