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
        '/' : (context) => const MainPage(),
        '/coin' : (context) => const CryptoCoinScreen(),
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
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            height: 32,
            width: 32,
          ),
          title: Text(
            'Bitcoin',
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            '150000\$',
            style: theme.textTheme.bodySmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed('/coin');
          },
        ),
      ),
    );
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bitcoin',
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
