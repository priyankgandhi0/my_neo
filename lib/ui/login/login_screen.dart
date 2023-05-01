import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';
import '../../main.dart';
import '../../utils/strings.dart';
import '../../widgets/neo_button.dart';
import '../../widgets/neo_text.dart';
import '../../widgets/neo_textfield.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var controller = Get.put(LoginController());

  var screenHeight = Get.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: GetBuilder<LoginController>(
        initState: (initState) {
          controller.loginInit();
        },
        builder: (ctrl) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatefulBuilder(builder: (s, ss) {
                  return SizedBox(
                    height: Get.height / 3,
                  );
                }),
                BootstrapCol(
                  sizes: 'col-10 col-sm-9 col-md-7 col-lg-5 col-xl-3',
                  offsets:
                      'offset-1 offset-sm-1 offset-md-3 offset-lg-3 offset-xl-5',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        titleText(),
                        description(),
                        emailField(),
                        passwordField(),
                        loginField(),
                      ],
                    ).paddingAll(20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  titleText() {
    return neoTextCommen(
      myNeo,
      fontsize: 30,
      fontFamily: GoogleFonts.oleoScript().fontFamily,
      weight: FontWeight.bold,
    ).paddingAll(30);
  }

  description() {
    return neoTextCommen(
      signInToStartYourSession,
      fontsize: 12,
    ).paddingAll(5);
  }

  emailField() {
    return NeoTextField(
      hint: enterUserName,
      error: controller.model.emailError,
      controller: controller.model.emailController,
      inputType: TextInputType.emailAddress,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      prefixIcon: const Icon(Icons.person).paddingAll(10),
    );
  }

  passwordField() {
    return NeoTextField(
      hint: enterPassword,
      controller: controller.model.passwordController,
      inputType: TextInputType.visiblePassword,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      error: controller.model.passwordError,
      obscureText: !controller.model.isShowPassword,
      prefixIcon: const Icon(Icons.password_sharp).paddingAll(10),
      sufixIcon: Icon(
        controller.model.isShowPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ).paddingOnly(right: 10).onClick(() {
        controller.setShowPassword();
      }),
    );
  }

  loginField() {
    return AppButton(
      onPress: () {
        controller.performLogin();
      },
      borderValue: 30,
      widget: controller.model.isLoading
          ? const SpinKitThreeInOut(
              color: Colors.white,
              size: 21.0,
            )
          : neoTextCommen(
              login,
              fontsize: 15.5,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
    ).paddingSymmetric(horizontal: 50);
  }
}
