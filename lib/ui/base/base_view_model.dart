import '../../storage/shared_pref.dart';

class BaseViewModel {
  bool isLoggedIn() {
    return preferences.getBool(key: SharedKeys.isLogin);
  }
}
