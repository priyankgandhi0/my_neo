import 'package:get/get.dart';
import 'package:my_neo/widgets/helper/snack.dart';
import '../../models/base_model.dart';
import '../../models/neo_base_model.dart';
import '../../models/user/create_user_model.dart';
import '../../models/user/get_all_user.dart';
import '../../network/repo/user_repo.dart';
import '../../utils/strings.dart';

import 'home_model.dart';

class HomeController extends GetxController {
  var model = HomeModel();
  var repo = UserRepo();

  void controlMenu() {
    if (!model.scaffoldKey.currentState!.isDrawerOpen) {
      model.scaffoldKey.currentState!.openDrawer();
    }
  }

  String generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  Future<void> deleteUser(num id) async {
    if(model.isLoggedIn()){
      startLoading();
      BaseModel response = await repo.deleteUser(uid: id);
      if (response.body != null) {
        var data = (response.body as NeoBaseModel);
        if (data.status ?? false) {
          getAlluser(model.currentPage);
        }
      }
    }
  }

  Future<void> editUser(UserData user) async {
    if (isEditUserValidate() && model.isLoggedIn()) {
      BaseModel response = await repo.updateUser(
          uid: user.uid,
          email: model.emailController.text,
          firstName: model.firstNameController.text,
          lastName: model.lastNameController.text,
          passWord: model.passwordController.text,
          phoneNumber: model.mobileNumberController.text);
      if (response.body != null) {
        var data = (response.body as CreateUserModel);
        if (data.status ?? false) {
          clearTextFields();
          stopLoading();
          Get.back();
          getAlluser(model.currentPage);
        } else {
          data.msg.errorSnack();
        }
      } else {
        stopLoading();
        someThingWentWrong.errorSnack();
      }
    }
  }

  void clearTextFields() {
    model.firstNameController.clear();
    model.lastNameController.clear();
    model.emailController.clear();
    model.mobileNumberController.clear();
    model.passwordController.clear();
    model.setPasswordError(null);
    model.setMobileNumberError(null);
    model.setLastNameError(null);
    model.setFirstNameError(null);
    model.setEmailError(null);
  }

  Future<void> addUser() async {
    if (isAddUserValidate() && model.isLoggedIn()) {
      startLoading();
      BaseModel response = await repo.createUser(
          email: model.emailController.text,
          firstName: model.firstNameController.text,
          lastName: model.lastNameController.text,
          passWord: model.passwordController.text,
          phoneNumber: model.mobileNumberController.text);
      if (response.body != null) {
        var data = response.body as CreateUserModel;
        if (data.status ?? false) {
          clearTextFields();
          stopLoading();
          Get.back();
          getAlluser(model.currentPage);
        } else {
          data.msg.errorSnack();
          stopLoading();
        }
      } else {
        someThingWentWrong.errorSnack();
        stopLoading();
      }
    }
  }

  Future<void> getAlluser(int currentPage) async {
    if(model.isLoggedIn()){
      startLoading();
      BaseModel response = await repo.getUserList(
        currentPage,
        model.currentSelectedValue!,
        model.userSearchController.text,
      );
      if (response.body != null) {
        var data = response.body as AllUserModel;
        if (data.status ?? false) {
          model.userList.clear();
          model.addToUserList(data.data ?? []);
          if (data.data?.length != model.currentSelectedValue) {
            model.setStopPagination(true);
          } else {
            model.setStopPagination(false);
          }
        } else {
          data.msg.errorSnack();
        }
      } else {
        someThingWentWrong.errorSnack();
      }
      stopLoading();
    }
  }

  startLoading() {
    model.setLoading(true);
    update();
  }

  stopLoading() {
    model.setLoading(false);
    update();
  }

  void previousPage() {
    if (model.currentPage > 1) {
      model.setCurrentPage(model.currentPage - 1);
      getAlluser(model.currentPage);
    }
  }

  void nextPage() {
    if (!model.stopPagination) {
      model.setCurrentPage(model.currentPage + 1);
      getAlluser(model.currentPage);
    }
  }



  void changeSelection(int? newValue) {
    model.setCurrentSelectedValue(newValue);
    model.setCurrentPage(1);
    getAlluser(model.currentPage);
  }

  bool isAddUserValidate() {
    if (model.emailController.text.isEmpty ||
        model.firstNameController.text.isEmpty ||
        model.lastNameController.text.isEmpty ||
        model.mobileNumberController.text.isEmpty ||
        model.passwordController.text.isEmpty ||
        !model.emailController.text.isEmail) {
      if (model.emailController.text.isEmpty) {
        model.setEmailError("Please Enter Email");
      } else {
        if (!model.emailController.text.isEmail) {
          model.setEmailError("Please Enter Correct Email");
        } else {
          model.setEmailError(null);
        }
      }
      if (model.firstNameController.text.isEmpty) {
        model.setFirstNameError("Please Enter FirstName");
      } else {
        model.setFirstNameError(null);
      }
      if (model.lastNameController.text.isEmpty) {
        model.setLastNameError("Please Enter LastName");
      } else {
        model.setLastNameError(null);
      }
      if (model.mobileNumberController.text.isEmpty) {
        model.setMobileNumberError("Please Enter mobile Number");
      } else {
        model.setMobileNumberError(null);
      }
      if (model.passwordController.text.isEmpty) {
        model.setPasswordError("Please Enter Password");
      } else {
        model.setPasswordError(null);
      }
      update(['DialogBuilder']);
      return false;
    }
    model.setPasswordError(null);
    model.setMobileNumberError(null);
    model.setLastNameError(null);
    model.setFirstNameError(null);
    model.setEmailError(null);
    update(['DialogBuilder']);
    return true;
  }

  bool isEditUserValidate() {
    if (model.emailController.text.isEmpty ||
        model.firstNameController.text.isEmpty ||
        model.lastNameController.text.isEmpty ||
        model.mobileNumberController.text.isEmpty ||
        !model.emailController.text.isEmail) {
      if (model.emailController.text.isEmpty) {
        model.setEmailError("Please Enter Email");
      } else {
        if (!model.emailController.text.isEmail) {
          model.setEmailError("Please Enter Correct Email");
        } else {
          model.setEmailError(null);
        }
      }
      if (model.firstNameController.text.isEmpty) {
        model.setFirstNameError("Please Enter FirstName");
      } else {
        model.setFirstNameError(null);
      }
      if (model.lastNameController.text.isEmpty) {
        model.setLastNameError("Please Enter LastName");
      } else {
        model.setLastNameError(null);
      }
      if (model.mobileNumberController.text.isEmpty) {
        model.setMobileNumberError("Please Enter mobile Number");
      } else {
        model.setMobileNumberError(null);
      }
      update(['DialogBuilder']);
      return false;
    }
    model.setMobileNumberError(null);
    model.setLastNameError(null);
    model.setFirstNameError(null);
    model.setEmailError(null);
    update(['DialogBuilder']);
    return true;
  }

  void searchUser() {
    model.setCurrentPage(1);
    getAlluser(model.currentPage);
  }

  void clearSearch() {
    model.userSearchController.clear();
    searchUser();
  }
}
