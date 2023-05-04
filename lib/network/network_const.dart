import '../storage/shared_pref.dart';

const baseUrl = 'https://codonnier.tech/parth/myNeo/api/';
const baseEndPoint = "Service.php";

Map<String, dynamic>? baseQueries(String s) => {
  "Service": s,
  "show_error": false,
};


class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Authorization";
  static const firebaseToken = "firebase-token";
  static const accessControlAllowOrigin = "Access-Control-Allow-Origin";
}

Future<Map<String, String>> requestHeader(bool passAuthToken) async {
  return {
    RequestHeaderKey.contentType: 'application/json',
    'Accept': '*/*',
    RequestHeaderKey.userAgent: 'MYNEO5698745parth',
    RequestHeaderKey.appSecret: 'MYNEO5698745parth',
    RequestHeaderKey.appTrackVersion: 'v1',
    RequestHeaderKey.appDeviceType: 'web',
    RequestHeaderKey.appStoreVersion: '1.1',
    RequestHeaderKey.appDeviceModel: 'iPhone 8',
    RequestHeaderKey.appOsVersion: 'iOS 11',
    RequestHeaderKey.appStoreBuildNumber: '1.1',
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    if (passAuthToken)RequestHeaderKey.firebaseToken: preferences.getToken()
  };
}