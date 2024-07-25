import 'package:flutter/material.dart';
import '../../../../shared/extension/extension.dart';
import '../../../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashState();
}

class SplashState extends BaseStateNoBloc<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      context.pushNamedAndRemoveUntil(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(width: 200, height: 200, child: Container()),
        ),
      ),
    );
  }
}
