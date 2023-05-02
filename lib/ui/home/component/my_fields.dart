import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import '../../../utils/responsive.dart';
import '../../../utils/strings.dart';
import '../../../widgets/neo_button.dart';
import '../../../widgets/neo_text.dart';
import '../../../widgets/neo_textfield.dart';
import '../../../widgets/themes/colors.dart';
import '../home_controller.dart';
import 'add_user_dialog.dart';

class MyFiles extends StatelessWidget {
  MyFiles({
    Key? key,
  }) : super(key: key);

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Users",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            addUserButton(context)
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }

  addUserButton(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: () {
        openAddUserDialog(null);
      },
      icon: const Icon(Icons.add),
      label: const Text("Add User"),
    );
  }


}
