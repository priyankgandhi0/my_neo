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
    startLoading();
    BaseModel response = await repo.deleteUser(uid: id);
    if (response.body != null) {
      var data = (response.body as NeoBaseModel);
      if (data.status ?? false) {
        getAlluser(model.currentPage);
      }
    }
  }

  Future<void> editUser(UserData user) async {
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
      someThingWentWrong.errorSnack();
    }
  }

  void clearTextFields() {
    model.firstNameController.clear();
    model.lastNameController.clear();
    model.emailController.clear();
    model.mobileNumberController.clear();
    model.passwordController.clear();
  }

  Future<void> addUser() async {
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
      }
    } else {
      someThingWentWrong.errorSnack();
    }
  }

  Future<void> getAlluser(int currentPage) async {
    startLoading();
    BaseModel response = await repo.getUserList(currentPage);
    if (response.body != null) {
      var data = response.body as AllUserModel;
      if (data.status ?? false) {
        model.userList.clear();
        model.addToUserList(data.data ?? []);
        if(data.data?.length!=5){
          model.setStopPagination(true);
        }else{
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

  startLoading() {
    model.setLoading(true);
    update();
  }

  stopLoading() {
    model.setLoading(false);
    update();
  }

  void previousPage() {
    if(model.currentPage>1){
      model.setCurrentPage(model.currentPage-1);
      getAlluser(model.currentPage);
    }
  }

  void nextPage() {
    if(!model.stopPagination){
      model.setCurrentPage(model.currentPage+1);
      getAlluser(model.currentPage);
    }
  }

  void logOut() {}
}
