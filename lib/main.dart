import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        '/': (context) => const MainPage(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      body: ListView.separated(
        separatorBuilder: (context, i) => const Divider(),
        itemCount: 10,
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin_logo.svg',
              height: 32,
              width: 32,
            ),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '150000\$',
              style: theme.textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin',
                arguments: coinName,
              );
            },
          );
        },
      ),
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
