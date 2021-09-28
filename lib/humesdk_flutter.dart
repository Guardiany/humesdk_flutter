
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class HumesdkFlutter {
  static const MethodChannel _channel =
      const MethodChannel('humesdk_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get sdkVersion async {
    if (Platform.isAndroid) {
      final String? version = await _channel.invokeMethod('getSdkVersion');
      return version;
    }
  }

  ///获取渠道号
  static Future<String?> get channel async {
    final String? result = await _channel.invokeMethod('getChannel');
    return result;
  }
}
