import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension extOnWidget on Widget {
  Widget get center {
    return Center(
      child: this,
    );
  }

  Widget get safeArea {
    return SafeArea(child: this);
  }

  Widget onClick(GestureTapCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: this,
    );
  }

  Widget onTap(GestureTapCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: this,
    );
  }

  Widget positioned(
      {double? left, double? right, double? top, double? bottom}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: this,
    );
  }
}

extension extOnDynamic on dynamic {
  get debugPrint {
    if (kDebugMode) {
      print("--->(@) ${this.toString()}");
    }
  }

  get printLine {
    if (kDebugMode) {
      print(
          "--------------------------------------------------------------------------------------------->(*)");
    }
  }
}

extension extOnString on String? {
  bool isJson() {
    bool status = false;
    if ((json.decode(this!) is Map)) {
      status = true;
    } else if ((json.decode(this!) is List)) {
      status = true;
    }
    return status;
  }
}
