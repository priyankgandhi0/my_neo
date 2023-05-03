import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:my_neo/models/user/get_all_user.dart';
import 'package:my_neo/ui/home/component/side_menu.dart';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';
import 'package:my_neo/widgets/themes/colors.dart';
import '../../widgets/neo_text.dart';

import 'component/add_user_dialog.dart';
import 'component/data_table.dart';
import 'component/header.dart';
import 'component/my_fields.dart';
import 'home_controller.dart';
import 'home_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);

    return GetBuilder<HomeController>(initState: (initState) {
      controller.model.setCurrentPage(1);
      controller.getAlluser(controller.model.currentPage);
    }, builder: (ctrl) {
      return Scaffold(
        key: ctrl.model.scaffoldKey,
        drawer: SideMenu(),
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
                    child: SideMenu(),
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-12 col-sm-12 col-md-12 col-lg-10',
                  absoluteSizes: false,
                  child: Container(
                    height: Get.height,
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
                        /*BootstrapCol(
                          sizes: 'col-12 col-sm-12 col-md-12 col-lg-12',
                          child: userTable(controller),
                        ),*/
                        BootstrapCol(
                          sizes:
                              'col-12 col-sm-12 col-md-11 col-lg-10 col-xl-12',
                          child: UserDataTableSource(ctrl.model.userList),
                        )
                      ],
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

  userTable(HomeController ctrl) {
    bootstrapGridParameters(gutterSize: 0);
    return BootstrapRow(
      children: [
        BootstrapCol(
          sizes: 'col-12 col-sm-12 col-md-8',
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: DataTable2(
                dataRowHeight: 100,
                columnSpacing: 20,
                minWidth: 600,
                headingRowHeight: 50,
                columns: [
                  DataColumn(
                    label: neoTextCommen(
                      "First Name",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: neoTextCommen(
                      "Last Name",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: neoTextCommen(
                      "Email Address",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: neoTextCommen(
                      "Mobile Number",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: Container(),
                  ),
                ],
                rows: List.generate(
                  ctrl.model.userList.length,
                  (index) => recentFileDataRow(ctrl.model.userList[index]),
                ),
              ),
            ),
          ).paddingAll(5),
        ),
      ],
    );
  }

  DataRow recentFileDataRow(UserData user) {
    return DataRow(
      cells: [
        DataCell(neoTextCommen(
          user.firstName ?? "",
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(neoTextCommen(
          user.lastName ?? "",
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: neoTextCommen(
            user.email ?? "",
            overflow: TextOverflow.ellipsis,
          ),
        )),
        DataCell(neoTextCommen(
          user.phoneNumber ?? "",
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(
          Row(
            children: [
              const Icon(Icons.edit).onClick(() {
                openAddUserDialog(user);
              }),
              const SizedBox(
                width: 20,
              ),
              const Icon(Icons.delete).onClick(() {
                controller.deleteUser(user.uid ?? -1);
              }),
            ],
          ),
        ),
      ],
    );
  }

  userTable2(HomeController controller) {
    bootstrapGridParameters(gutterSize: 0);
    return BootstrapRow(
      children: [
        BootstrapCol(
          sizes: 'col-12 col-sm-12 col-md-8',
          child: Container(
            height: 600,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BootstrapContainer(fluid: true, children: [
                  BootstrapRow(
                    children: [
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      ),
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      ),
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      ),
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      ),
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      ),
                      BootstrapCol(
                        sizes: 'col-2 col-sm-2 col-md-2',
                        child: Container(
                          color: Colors.pink,
                          height: 50,
                        ).paddingAll(1),
                      )
                    ],
                  )
                ]);
              },
              itemCount: 10,
            ),
          ).paddingAll(5),
        ),
      ],
    );
  }
}
