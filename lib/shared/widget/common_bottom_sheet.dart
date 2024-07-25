import 'package:flutter/material.dart';

import 'common_gradient.dart';

showPrimaryBottomSheet(
    {required BuildContext context, required WidgetBuilder builder}) {
  showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
            decoration: BoxDecoration(
              gradient: CommonGradient.primary,
            ),
            child: builder(context),
          ));
}
