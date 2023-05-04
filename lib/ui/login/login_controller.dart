import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_neo/storage/shared_pref.dart';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';
import '../../models/auth/admin_login.dart';
import '../../models/base_model.dart';
import '../../network/repo/auth_repo.dart';
import '../../utils/routes.dart';
import '../../utils/strings.dart';
import '../../widgets/helper/snack.dart';
import 'login_model.dart';

class LoginController extends GetxController {
  var model = LoginModel();
  var repo = AuthRepo();

  setShowPassword() {
    model.setShowPassword();
    update();
  }

  bool isValidate() {
    if (model.emailController.text.trim().isEmpty ||
        model.passwordController.text.trim().isEmpty ||
        !model.emailController.text.isEmail) {
      if (model.emailController.text.trim().isEmpty) {
        model.setEmailError(emailIsEmpty);
      } else {
        if (!model.emailController.text.isEmail) {
          model.setEmailError(emailIsNotValid);
        } else {
          model.setEmailError("");
        }
      }
      if (model.passwordController.text.trim().isEmpty) {
        model.setPasswordError(passwordIsNotValid);
      } else {
        model.setPasswordError("");
      }
      update();
      return false;
    }
    model.setEmailError("");
    model.setPasswordError("");
    update();
    return true;
  }

  Future<void> performLogin() async {
    if (isValidate()) {
      startLoading();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.emailController.text.toString(),
          password: model.passwordController.text.toString(),
        );
        if (userCredential.user != null) {
          performNetworkCall(userCredential.user?.uid,userCredential.user?.email);
        }else{
          someThingWentWrong.errorSnack();
        }
      } on FirebaseAuthException catch (e) {
        stopLoading();
        if (e.code == fireBaseUserNotFound) {
          noUserFoundForThatEmail.errorSnack();
        } else if (e.code == wrongPassWord) {
          wrongPassword.errorSnack();
        }
      }
    }
  }

  clearText() {
    model.setTextToEmailCotnroller("");
    model.setTextToPasswordController("");
    update();
  }

  startLoading() {
    model.setIsLoading(true);
    update();
  }

  stopLoading() {
    model.setIsLoading(false);
    update();
  }

  void loginInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        userIsSignedOut.debugPrint;
      } else {
        userIsSignedIn.debugPrint;
      }
    });
  }

  Future<void> performNetworkCall(String? uid, String? email) async {
    if(uid!=null && email!=null){
      BaseModel response = await repo.adminLogin(email: email, token: uid);
      if(response.body!=null){
        AdminLogin data = (response.body as AdminLogin);
        if(data.status ?? false){
          await preferences.saveToken(data.data?.firebaseToken ?? '');
          await preferences.save(key: SharedKeys.isLogin, data: true);
          loggedInSuccessFully.successSnack();
          stopLoading();
          clearText();
          Get.toNamed(Routes.home);
        }else{
          data.msg.errorSnack();
          stopLoading();
        }
      }else{
        someThingWentWrong.errorSnack();
        stopLoading();
      }
    }else{
      someThingWentWrong.errorSnack();
      stopLoading();
    }
  }
}
