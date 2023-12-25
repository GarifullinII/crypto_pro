import 'dart:async';

import 'package:crypto_pro/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_pro.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(talker: talker));

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  GetIt.I.registerSingleton<AbstractCoinsRepository>(
      CryptoCoinsRepository(dio: dio));

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(
        details.exception,
        details.stack,
      );

  runZonedGuarded(
    () => runApp(const CryptoPro()),
    (error, stackTrace) => GetIt.I<Talker>().handle(error, stackTrace),
  );
}
