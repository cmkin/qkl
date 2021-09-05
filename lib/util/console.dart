import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class console {
  static Map config = {
    "show": true //是否打印，在生产环境下，请填写 false
  };
  static void init(Map config) {
    config = config;
  }

  static void log(msg, {int lv = 11, String tag, bool isJson = false}) {
    Logger.levelDebug = lv;
    if (config['show']) {
      if (isJson) {
        Logger.json(msg, tag: tag);
      }
      tag == null ? Logger.d(msg) : Logger.d(msg, tag: tag);
    }
  }
}
