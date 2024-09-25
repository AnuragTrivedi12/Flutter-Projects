import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CommonColor.dart';

class CommonBoxDecoration{
  static BoxDecoration roundCornder_shadowBox = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(1,1),
          blurRadius: 2,
        ),
      ]
  );

  static BoxDecoration roundCornder_shadowBox_20 = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(1,1),
          blurRadius: 2,
        )
      ]
  );

  static BoxDecoration roundCorner_checked = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          color: common_clr,
          width: 2
      )
  );
}