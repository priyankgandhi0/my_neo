import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';

import '../../utils/routes.dart';
import '../../utils/strings.dart';
import '../../widgets/helper/snack.dart';
import 'login_model.dart';

class LoginController extends GetxController {
  var model = LoginModel();

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
          showAppSnackBar(
            loggedInSuccessFully,
            type: SnackType.success,
          );
        }
        stopLoading();
        clearText();
        Get.toNamed(Routes.home);
      } on FirebaseAuthException catch (e) {
        stopLoading();
        if (e.code == fireBaseUserNotFound) {
          showAppSnackBar(
            noUserFoundForThatEmail,
            type: SnackType.error,
          );
        } else if (e.code == wrongPassWord) {
          showAppSnackBar(
            wrongPassword,
            type: SnackType.error,
          );
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
  }

  stopLoading() {
    model.setIsLoading(false);
  }

  void loginInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(userIsSignedOut);
      } else {
        print(userIsSignedIn);
      }
    });
  }
}
