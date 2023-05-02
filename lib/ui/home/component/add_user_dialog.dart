import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_neo/ui/home/home_model.dart';

import '../../../utils/strings.dart';
import '../../../widgets/neo_button.dart';
import '../../../widgets/neo_text.dart';
import '../../../widgets/neo_textfield.dart';
import '../../../widgets/themes/colors.dart';
import '../home_controller.dart';

openAddUserDialog(UserModel? user) {
  Get.dialog(AddUserDialog(user)).whenComplete((){
    Get.find<HomeController>().clearTextFields();
  });
}

class AddUserDialog extends StatefulWidget {
  UserModel? user;

  AddUserDialog(this.user, {Key? key}) : super(key: key);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  var controller = Get.find<HomeController>();

  @override
  void initState() {
    controller.model.setEmailText(widget.user?.email ?? "");
    controller.model.setFirstNameText(widget.user?.firstName ?? "");
    controller.model.setLastNameText(widget.user?.lastName ?? "");
    controller.model.setMobileNameText(widget.user?.mobileNumber ?? "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 350,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailTextField(),
            firstNameTextField(),
            lastNameTextField(),
            mobileNumberTextField(),
            addUserButton(widget.user),
          ],
        ),
      ),
    );
  }

  emailTextField() {
    return NeoTextField(
      hint: enterEmailAdress,
      inputType: TextInputType.emailAddress,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      controller: controller.model.emailController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.email,
        color: bgColor,
      ).paddingAll(10),
    ).paddingAll(10);
  }

  firstNameTextField() {
    return NeoTextField(
      hint: enterFirstName,
      inputType: TextInputType.text,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      controller: controller.model.firstNameController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.person,
        color: bgColor,
      ).paddingAll(10),
    ).paddingAll(10);
  }

  lastNameTextField() {
    return NeoTextField(
      hint: enterLastName,
      inputType: TextInputType.text,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      controller: controller.model.lastNameController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.person,
        color: bgColor,
      ).paddingAll(10),
    ).paddingAll(10);
  }

  addUserButton(UserModel? user) {
    return AppButton(
      onPress: () {
        if (user != null) {
          controller.editUser(user);
        } else {
          controller.addUser();
        }
        Get.back();
      },
      borderValue: 30,
      widget: neoTextCommen(
        user != null ? editUser : addUser,
        fontsize: 15.5,
        weight: FontWeight.bold,
      ),
    ).paddingSymmetric(horizontal: 50);
  }

  mobileNumberTextField() {
    return NeoTextField(
      hint: enterMobileNumber,
      inputType: TextInputType.text,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      controller: controller.model.mobileNumberController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.mobile_friendly_outlined,
        color: bgColor,
      ).paddingAll(10),
    ).paddingAll(10);
  }
}
