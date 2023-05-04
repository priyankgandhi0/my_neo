import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../globle.dart';
import '../../../storage/shared_pref.dart';
import '../../../utils/routes.dart';

import '../home_controller.dart';

openLogoutDialog() {
  Get.dialog(LogoutDialog()).whenComplete(() {
    Get.find<HomeController>().clearTextFields();
  });
}

class LogoutDialog extends StatelessWidget {
  LogoutDialog({Key? key}) : super(key: key);

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              neoTextCommen(
                logout,
                fontsize: 22,
                color: bgColor,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 30,
              ),
              neoTextCommen(areYouSureYouWantToLogout, color: bgColor),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: AppButton(
                        onPress: () {
                          Get.back();
                        },
                        borderValue: 30,
                        text: cancel,
                        buttonColor: Colors.grey,
                      ).paddingAll(10)),
                  Expanded(
                      child: AppButton(
                        onPress: () async {
                          Get.back();
                          await preferences.save(
                            key: SharedKeys.isLogin,
                            data: false,
                          );
                          Get.offAllNamed(Routes.login);
                        },
                        borderValue: 30,
                        text: logout,
                      ).paddingAll(10)),
                ],
              )
            ],
          ).center,
        ),
      ),
    );
  }
}
