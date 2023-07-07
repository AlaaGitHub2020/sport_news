import 'package:flutter/services.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import "package:yaml/yaml.dart";

class Config {
  static YamlMap? _config;

  Future<void> load() async {
    if (_config == null) {
      final data = await rootBundle.loadString(Strings.fiAppConfig);
      Config._config = loadYaml(data);
    } else {
      throw ("Config already loaded");
    }
  }

  String get(String key) {
    return Config._config!.value[key];
  }
}
