import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedboxExtension on num {
  SizedBox get pw => SizedBox(width: toDouble().w);
  SizedBox get ph => SizedBox(
        height: toDouble().h,
      );
}

extension Capitalize on String {
  String upperCaseFirstLetter() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension PaddingExtension on Widget {
  Padding addPadding(L, R, T, B) {
    return Padding(
      padding: EdgeInsets.only(
          left: L.toDouble(),
          right: R.toDouble(),
          top: T.toDouble(),
          bottom: B.toDouble()),
      child: this,
    );
  }

  Padding addSymmetricPadding(
    H,
    V,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: H.toDouble(), vertical: V.toDouble()),
      child: this,
    );
  }
}

extension CenterExtension on Widget {
  Center center() {
    return Center(
      child: this,
    );
  }
}

extension PositionedExtension on Widget {
  Positioned positioned([L, R, T, B]) {
    return Positioned(left: L, right: R, top: T, bottom: B, child: this);
  }
}
