import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPrefsUtils();

class SharedPrefsUtils{
  SharedPreferences? _sharedPreferences;

  init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<void> save({
    required String key,
    required dynamic data,
  }) async {
    if (_sharedPreferences != null) {
      if (data is String) {
        await _sharedPreferences?.setString(key, data);
      } else if (data is int) {
        await _sharedPreferences?.setInt(key, data);
      } else if (data is double) {
        await _sharedPreferences?.setDouble(key, data);
      } else if (data is bool) {
        await _sharedPreferences?.setBool(key, data);
      }
    }
    return;
  }

  String getString({required String key, String defaultVal = ""}) {
    return _sharedPreferences != null
        ? _sharedPreferences!.getString(key) ?? defaultVal
        : defaultVal;
  }

  int getInt({required String key}) {
    return _sharedPreferences != null
        ? _sharedPreferences!.getInt(key) ?? 0
        : 0;
  }

  double getDouble({required String key}) {
    return _sharedPreferences != null
        ? _sharedPreferences!.getDouble(key) ?? 0.0
        : 0.0;
  }

  bool getBool({required String key}) {
    return _sharedPreferences != null
        ? _sharedPreferences!.getBool(key) ?? false
        : false;
  }

  String getToken() {
    return preferences.getString(key: SharedKeys.AUTH_TOKEN);
  }

  Future<void> saveToken(String token) async {
    await preferences.save(key: SharedKeys.AUTH_TOKEN, data: token);
  }

  putAppDeviceInfo() async {
    if (kIsWeb) {
      save(key: SharedKeys.APP_DEVICE_MODEL, data: "Test");
      save(key: SharedKeys.APP_OS_VERSION, data: "Web 1.0");
      save(key: SharedKeys.APP_STORE_VERSION, data: "1.0.0");
      save(key: SharedKeys.APP_STORE_BUILD_NUMBER, data: "1.0.0");
      save(key: SharedKeys.APP_DEVICE_TYPE, data: "web");
    } else {
      bool isiOS = Platform.isIOS;
      save(key: SharedKeys.APP_DEVICE_TYPE, data: isiOS ? "iOS" : "android");
      var deviceInfo = await appDeviceInfo();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (isiOS) {
        IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
        save(key: SharedKeys.APP_DEVICE_MODEL, data: deviceInfo.model);
        save(
            key: SharedKeys.APP_OS_VERSION,
            data: "iOS ${iosDeviceInfo.systemVersion}");
      } else {
        AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
        save(key: SharedKeys.APP_DEVICE_MODEL, data: androidDeviceInfo.model);
        save(
            key: SharedKeys.APP_OS_VERSION,
            data: androidDeviceInfo.version.release);
      }
      save(key: SharedKeys.APP_STORE_VERSION, data: packageInfo.version);
      save(
          key: SharedKeys.APP_STORE_BUILD_NUMBER,
          data: packageInfo.buildNumber);
    }
  }

  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }
}

class SharedKeys {
  static const APP_DEVICE_TYPE = "App-Device-Type";
  static const APP_STORE_VERSION = "App-Store-Version";
  static const APP_DEVICE_MODEL = "App-Device-Model";
  static const APP_OS_VERSION = "App-Os-Version";
  static const APP_STORE_BUILD_NUMBER = "App-Store-Build-Number";
  static const AUTH_TOKEN = "Auth-Token";
  static const MOBILE = "mobile";
  static const TOPIC_TITLE = "title";
  static const TOPIC_DETAILS_TITLE = "topic_details_title";
  static const TOPIC_DETAILS_NAME = "topic_details_name";
  static const TOPIC_DETAILS_NAME_COUNT = "topic_details_name_count";

  static const isLogin = 'isLogin';
  static const userDetail = 'LoginDetail';
}


