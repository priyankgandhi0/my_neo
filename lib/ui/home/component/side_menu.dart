import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/strings.dart';
import '../../../widgets/neo_text.dart';
import '../../../widgets/themes/colors.dart';
import 'add_user_dialog.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  titleText() {
    return neoTextCommen(
      myNeo,
      fontsize: 30,
      fontFamily: GoogleFonts.oleoScript().fontFamily,
      weight: FontWeight.bold,
      color: Colors.white,
    ).paddingAll(30);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
     shadowColor: Colors.transparent,
      child: ListView(
        children: [
          DrawerHeader(
            child: titleText(),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              openLogoutDialog();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
