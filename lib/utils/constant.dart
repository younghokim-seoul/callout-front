import 'package:callout/utils/dev_log.dart';

abstract class Const {
  static LogLevel logLevel = LogLevel.v;
  static bool useProxy = false;
  static String proxyAddress = "192.168.0.2:8888";
}