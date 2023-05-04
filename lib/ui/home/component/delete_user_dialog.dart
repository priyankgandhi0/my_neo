import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user/get_all_user.dart';
import '../home_controller.dart';
import '../../../globle.dart';

openDeleteUserDialog(UserData? user) {
  Get.dialog(DeleteUserDialog(user)).whenComplete(() {
    Get.find<HomeController>().clearTextFields();
  });
}

class DeleteUserDialog extends StatelessWidget {
  UserData? user;

  DeleteUserDialog(this.user, {Key? key}) : super(key: key);

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
                deleteUser,
                fontsize: 22,
                color: bgColor,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 30,
              ),
              neoTextCommen(areYouSureToDelete,
                  color: bgColor, fontsize: 16, align: TextAlign.center),
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
                        text: 'Cancel',
                        buttonColor: Colors.grey,
                      ).paddingAll(10)),
                  Expanded(
                      child: AppButton(
                        onPress: () {
                          controller.deleteUser(user?.uid ?? -1);
                          Get.back();
                        },
                        borderValue: 30,
                        text: 'Delete',
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