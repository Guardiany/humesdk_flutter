import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:humesdk_flutter/humesdk_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _sdkVersion = 'Unknown';
  String _channel = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String sdkVersion;
    String channel;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await HumesdkFlutter.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    try {
      sdkVersion =
          await HumesdkFlutter.sdkVersion ?? 'Unknown ssdk version';
    } on PlatformException {
      sdkVersion = 'Failed to get sdk version.';
    }
    try {
      channel =
          await HumesdkFlutter.channel ?? 'Unknown channel';
    } on PlatformException {
      channel = 'Failed to get channel.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _sdkVersion = sdkVersion;
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\nSdk Version: $_sdkVersion\nChannel: $_channel'),
        ),
      ),
    );
  }
}
