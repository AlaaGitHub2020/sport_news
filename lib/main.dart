import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sport_news/domain/analytics/i_analytics_repository.dart';
import 'package:sport_news/domain/core/utilities/config.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/domain/remote_config/i_remote_config_repository.dart';
import 'package:sport_news/injection.dart';
import 'package:sport_news/presentation/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final log = getLogger();

void main() async {
  log.i("main Started");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await appConfiguration();

  runApp(const AppWidget());

  FlutterNativeSplash.remove();
}

Future<void> appConfiguration() async {
  try {
    log.i("appConfiguration Started");
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      addFontLicense();
      prepareTheLogger();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Config().load();
      await configureInjection(Environment.prod);
      await getIt<IAnalyticsRepository>().logAppOpen();
            await getIt<IRemoteConfigRepository>().setConfigSettings(
                fetchTimeoutInMinutes: 1, minimumFetchIntervalInHours: 1);
    } else if (Platform.isWindows) {
      //todo : build the Windows App version
    } else {
      //todo : build the other platform App version or ignore them
    }
  } catch (e) {
    log.e(e);
  }
}

void addFontLicense() {
  try {
    log.i("addFontLicense Started");
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  } catch (e) {
    log.e(e);
  }
}

void prepareTheLogger() {
  try {
    log.i("prepareTheLogger Started");
    if (kReleaseMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
  } catch (e) {
    log.e(e);
  }
}
