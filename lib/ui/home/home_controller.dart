import 'package:get/get.dart';

import 'home_model.dart';

class HomeController extends GetxController {
  var model = HomeModel();

  void controlMenu() {
    if (!model.scaffoldKey.currentState!.isDrawerOpen) {
      model.scaffoldKey.currentState!.openDrawer();
    }
  }

  void addUser() {
    model.addToUserList(
      UserModel(
          generateId(),
          model.firstNameController.text,
          model.lastNameController.text,
          model.emailController.text,
          model.mobileNumberController.text),
    );
    model.firstNameController.clear();
    model.lastNameController.clear();
    model.emailController.clear();
    model.mobileNumberController.clear();
    update();
  }

  String generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  void deleteUser(String id) {
    model.userList.removeWhere((element) => element.id == id);
    update();
  }

  void editUser(UserModel? user) {
    var index = model.userList.indexOf(user!);
    model.userList.removeAt(index);
    model.userList.insert(
        index,
        UserModel(
            user.id,
            model.firstNameController.text,
            model.lastNameController.text,
            model.emailController.text,
            model.mobileNumberController.text));
    update();
  }

  void clearTextFields() {
    model.firstNameController.clear();
    model.lastNameController.clear();
    model.emailController.clear();
    model.mobileNumberController.clear();
  }
}
