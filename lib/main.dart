import 'package:crypto_pro/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypto_pro.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  GetIt.I.registerSingleton<AbstractCoinsRepository>(CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoPro());
}