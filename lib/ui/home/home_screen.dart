import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:my_neo/ui/home/component/side_menu.dart';
import 'package:my_neo/widgets/helper/snack.dart';
import '../../utils/routes.dart';
import 'component/add_user_dialog.dart';
import 'component/data_table.dart';
import 'component/header.dart';
import '../../../globle.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        if (!controller.model.isLoggedIn()) {
          pleaseDoLoginFirst.errorSnack();
          Get.offAllNamed(Routes.login);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return GetBuilder<HomeController>(initState: (initState) {
      controller.model.setCurrentPage(1);
      controller.getAlluser(controller.model.currentPage);
    }, builder: (ctrl) {
      return Scaffold(
        key: ctrl.model.scaffoldKey,
        drawer: const SideMenu(),
        body: BootstrapContainer(
          fluid: true,
          children: [
            BootstrapRow(
              children: [
                BootstrapCol(
                  sizes: 'col-3 col-sm-3 col-md-3 col-lg-2',
                  invisibleForSizes: 'xs sm md',
                  absoluteSizes: false,
                  child: Container(
                    color: secondaryColor,
                    height: Get.height,
                    child: const SideMenu(),
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-12 col-sm-12 col-md-12 col-lg-10',
                  absoluteSizes: false,
                  child: Container(
                    height: Get.height,
                    child: SingleChildScrollView(
                      child: BootstrapRow(
                        children: [
                          BootstrapCol(
                            sizes: 'col-12 col-sm-12 col-md-12 col-lg-12',
                            child: Header().paddingAll(15),
                          ),
                          BootstrapCol(
                            sizes: 'col-12 col-sm-12 col-md-12 col-lg-12',
                            child: BootstrapRow(
                              children: [
                                BootstrapCol(
                                  sizes:
                                      'col-4 col-sm-3 col-md-3 col-lg-3 col-xl-2',
                                  child: neoTextCommen("My Users", fontsize: 18)
                                      .paddingAll(10),
                                ),
                                BootstrapCol(
                                  sizes:
                                      'col-4 col-sm-4 col-md-3 col-lg-3 col-xl-2',
                                  offsets:
                                      'offset-4 offset-sm-5 offset-md-5 offset-lg-5 offset-xl-10',
                                  child: addUserButton(context),
                                ),
                              ],
                            ),
                          ),
                          BootstrapCol(
                            sizes:
                                'col-12 col-sm-12 col-md-11 col-lg-10 col-xl-12',
                            child: UserDataTableSource(ctrl.model.userList),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  addUserButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        openAddUserDialog(null);
      },
      icon: const Icon(Icons.add),
      label: const Text("Add User"),
    ).paddingAll(10);
  }
}
