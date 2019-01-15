import 'package:flutter/material.dart';
import 'color_util.dart';

class AppBarUtils {
  static AppBar appBar(String title, BuildContext context,
      [Widget leading, List<Widget> actions]) {
    void backAction() {
      Navigator.pop(context);
    }

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Color.fromARGB(255, 45, 45, 45),
            fontWeight: FontWeight.w300,
            fontSize: 18,
            fontFamily: 'PingFang'),
      ),
      centerTitle: true,
      leading: leading ??
          IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: ColorUtils.iconColor, size: 20),
            onPressed: backAction,
          ),
      actions: actions,
    );
  }
}

class DeviceUtils {
  static bool iPhoneXAbove(BuildContext context) {
    return (DeviceUtils.sreenWidth(context) >= 375 &&
        DeviceUtils.sreenHeight(context) >= 812);
  }

  static double sreenWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width);
  }

  static double sreenHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height);
  }
}
