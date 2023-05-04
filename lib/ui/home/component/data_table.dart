import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_neo/models/user/get_all_user.dart';
import '../../../utils/responsive.dart';
import '../home_controller.dart';
import 'add_user_dialog.dart';
import 'delete_user_dialog.dart';
import '../../../globle.dart';

class UserDataTableSource extends StatelessWidget {
  List<UserData> userList;

  UserDataTableSource(this.userList, {Key? key}) : super(key: key);
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Responsive(
                mobile: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: userDataTable(0, 0),
                ),
                tablet: userDataTable(30, 10),
                desktop: userDataTable(60, 20),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            typeFieldWidget(),
            pageCounter().paddingAll(10),
          ],
        ),
      ],
    );
  }

  Widget pageCounter() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 0.3,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.3,
              ),
            ),
            child: const Icon(
              Icons.skip_previous,
            ).paddingAll(10),
          ).onClick(() {
            controller.previousPage();
          }),
          Container(
            child: neoTextCommen(controller.model.currentPage.toString())
                .paddingSymmetric(horizontal: 20),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.3,
              ),
            ),
            child: const Icon(
              Icons.skip_next,
            ).paddingAll(10),
          ).onClick(() {
            controller.nextPage();
          }),
        ],
      ),
    );
  }

  userDataTable(double columnSpacing, double spaceBetweenIcons) {
    return DataTable(
            columnSpacing: columnSpacing,
            border: TableBorder.all(color: Colors.white, width: 0.3),
            columns: [
              DataColumn(
                label: Expanded(
                  child: neoTextCommen('Email Address'),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: neoTextCommen('First Name'),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: neoTextCommen('Last Name'),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: neoTextCommen('Phone Number'),
                ),
              ),
              DataColumn(
                label: neoTextCommen(''),
              ),
            ],
            rows:
                userList.map((e) => userDataRow(e, spaceBetweenIcons)).toList())
        .paddingAll(10);
  }

  DataRow userDataRow(UserData data, double spaceBetweenIcons) {
    return DataRow(cells: [
      DataCell(neoTextCommen(data.email ?? '')),
      DataCell(neoTextCommen(data.firstName ?? '')),
      DataCell(neoTextCommen(data.lastName ?? '')),
      DataCell(FittedBox(
        child: neoTextCommen(data.phoneNumber ?? ''),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.edit).onClick(() {
            openAddUserDialog(data);
          }),
          SizedBox(
            width: spaceBetweenIcons,
          ),
          const Icon(Icons.delete).onClick(() {
            openDeleteUserDialog(data);
          }),
        ],
      )),
    ]);
  }

  pageLimitDrawer() {
    var items = ['5', '10', '20', '50'];
    return DropdownButton<String>(
      hint: neoTextCommen(""),
      selectedItemBuilder: (as) {
        return items.map<Widget>((String item) {
          return Center(
            child: Text(item),
          );
        }).toList();
      },
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  Widget typeFieldWidget() {
    return Container(
      width: 80,
      height: 50,
      padding: EdgeInsets.zero,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                iconEnabledColor: Colors.transparent,
                focusColor: Colors.transparent,
                value: controller.model.currentSelectedValue,
                onChanged: (newValue) {
                  controller.changeSelection(newValue);
                },
                items: controller.model.deviceTypes.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
