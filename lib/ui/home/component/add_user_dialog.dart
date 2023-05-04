import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_neo/models/user/get_all_user.dart';
import '../../../globle.dart';


import '../home_controller.dart';

openAddUserDialog(UserData? user) {
  Get.dialog(AddUserDialog(user)).whenComplete(() {
    Get.find<HomeController>().clearTextFields();
  });
}

class AddUserDialog extends StatefulWidget {
  UserData? user;

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
    controller.model.setMobileNameText(widget.user?.phoneNumber ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GetBuilder<HomeController>(
        id: 'DialogBuilder',
        builder: (ctrl) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 540,
            width: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emailTextField(),
                firstNameTextField(),
                lastNameTextField(),
                mobileNumberTextField(),
                widget.user == null ? passwordTextField() : Container(),
                addUserButton(widget.user),
                cancelButton()
              ],
            ),
          );
        },
      ),
    );
  }

  emailTextField() {
    return NeoTextField(
      hint: enterEmailAdress,
      inputType: TextInputType.emailAddress,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      error: controller.model.emailError,
      fontSize: 14,
      controller: controller.model.emailController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.email,
        color: bgColor,
      ).paddingAll(10),
    ).paddingSymmetric(vertical: 10, horizontal: 20);
  }

  firstNameTextField() {
    return NeoTextField(
      hint: enterFirstName,
      inputType: TextInputType.text,
      error: controller.model.firstNameError,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      controller: controller.model.firstNameController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.person,
        color: bgColor,
      ).paddingAll(10),
    ).paddingSymmetric(vertical: 10, horizontal: 20);
  }

  lastNameTextField() {
    return NeoTextField(
      hint: enterLastName,
      error: controller.model.lastNameError,
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
    ).paddingSymmetric(vertical: 10, horizontal: 20);
  }

  mobileNumberTextField() {
    return NeoTextField(
      hint: enterMobileNumber,
      inputType: TextInputType.text,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      error: controller.model.mobileNumberError,
      controller: controller.model.mobileNumberController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.mobile_friendly_outlined,
        color: bgColor,
      ).paddingAll(10),
    ).paddingSymmetric(vertical: 10, horizontal: 20);
  }

  passwordTextField() {
    return NeoTextField(
      hint: enterPassword,
      inputType: TextInputType.text,
      hintColor: Colors.grey.withOpacity(0.5),
      maxLines: 1,
      fontSize: 14,
      error: controller.model.passwordError,
      controller: controller.model.passwordController,
      textColor: bgColor,
      prefixIcon: const Icon(
        Icons.password_sharp,
        color: bgColor,
      ).paddingAll(10),
    ).paddingSymmetric(vertical: 10, horizontal: 20);
  }

  addUserButton(UserData? user) {
    return AppButton(
      onPress: () {
        if (user != null) {
          controller.editUser(user);
        } else {
          controller.addUser();
        }
      },
      borderValue: 30,
      widget: neoTextCommen(
        user != null ? editUser : addUser,
        fontsize: 15.5,
        weight: FontWeight.bold,
      ),
    ).paddingSymmetric(horizontal: 50, vertical: 8);
  }

  cancelButton() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: bgColor,
              width: 1.0, // Underline thickness
            ),
          ),
        ),
        child: neoTextCommen(
          cancel,
          color: secondaryColor,
          fontsize: 16,
        ),
      ),
    );
  }
}


