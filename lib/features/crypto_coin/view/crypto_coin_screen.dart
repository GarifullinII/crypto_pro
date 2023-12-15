import 'package:flutter/material.dart';

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
