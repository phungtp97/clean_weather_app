import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget square(double size) {
    return SizedBox(
      height: size,
      width: size,
      child: this,
    );
  }

  Widget padding([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget paddingOnly({double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, right: right ?? 0, top: top ?? 0, bottom: bottom ?? 0),
      child: this,
    );
  }

  Widget margin([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget circleRect(double size, {Color? color}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      child: Container(
        height: size,
        width: size,
        color: color,
        child: this,
      ),
    );
  }

  Widget inkTap({required Function onTap}) {
    return InkWell(
      onTap: () => onTap.call(),
      child: this,
    );
  }

  Widget circleInkWell({required Function onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap.call(),
        child: this,
      ),
    );
  }

  Widget shadow({required List<BoxShadow> shadows}) {
    return this;
  }

  Widget rectAll(double radius,
      {Color? color, Color? borderColor, double? borderWidth}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: Border.all(
                color: borderColor ?? Colors.white, width: borderWidth ?? 0)),
        child: this,
      ),
    );
  }

  Widget expand({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget center() => Center(child: this,);

  Widget align(AlignmentGeometry alignment) => Align(alignment: alignment, child: this,);
}
