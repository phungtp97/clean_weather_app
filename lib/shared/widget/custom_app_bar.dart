import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../gen/assets.gen.dart';
import '../shared.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final BuildContext context;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final Widget? leading;
  final bool? centerTitle;
  final Widget? customTitle;
  final Color? backgroundColor;
  final double? leadingWidth;
  final Color? iconColor;
  final Color? titleColor;
  final bool? hideLeading;

  const CustomAppBar._(
      {Key? key,
      this.title,
      this.elevation = 0.0,
      this.actions,
      this.titleColor,
      this.bottom,
      this.onLeadingPressed,
      this.leading,
      this.customTitle,
      this.centerTitle,
      this.backgroundColor,
      this.leadingWidth,
      this.iconColor,
      required this.context,
      this.hideLeading})
      : super(key: key);

  factory CustomAppBar.simplePrimary(BuildContext context,
          {String? title, bool? centerTitle, bool? hideLeading}) =>
      CustomAppBar._(
        backgroundColor: Palette.lightPrimary1,
        context: context,
        title: title,
        titleColor: Palette.textDark,
        iconColor: Palette.lightBackground1,
        centerTitle: centerTitle,
        hideLeading: hideLeading,
      );

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'appbar',
        child: Material(
            color: Colors.transparent,
            child: AppBar(
              backgroundColor: backgroundColor,
              titleSpacing: 20,
              elevation: elevation,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Platform.isIOS ? Brightness.light : null,
                statusBarIconBrightness:
                    Platform.isIOS ? null : Brightness.dark,
              ),
              automaticallyImplyLeading: !(hideLeading ?? false),
              leading: (hideLeading ?? false)
                  ? null
                  : IconButton(
                      onPressed: () {
                        if (onLeadingPressed != null) {
                          onLeadingPressed?.call();
                          return;
                        }
                        Navigator.of(context).pop();
                      },
                      icon: leading ??
                          Assets.svg.icChevronLeft.svg(colorFilter: ColorFilter.mode(iconColor ?? Palette.lightBackground1, BlendMode.srcIn)),
                    ),
              leadingWidth: leadingWidth,
              bottom: bottom,
              title: customTitle ??
                  title?.text(
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: titleColor),
                  ),
              centerTitle: centerTitle,
              actions: actions,
            )));
  }

  double height(BuildContext context) => dimens.height;

  AppBarDimensions get dimens => Dimens.appBar(context);

  @override
  Size get preferredSize => Size.fromHeight(height(context));
}
