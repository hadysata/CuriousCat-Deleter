import 'package:flutter/material.dart';

class EasyNavigator {
  static Future<void> openPage(
      {required BuildContext context,
      required page,
      bool isAnimated = false,
      bool isPushReplaced = false,
      bool isPushAndRemoveUntil = false}) async {
    if (isPushAndRemoveUntil) {
      Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (Route<dynamic> route) => false);

      return;
    }

    if (isPushReplaced) {

      await Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder:
              (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
      return;
    }

    if (!isAnimated) {
      await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        fullscreenDialog: false,
        builder: (BuildContext context) => page,
      ));
    } else if (isAnimated) {
      await Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder:
              (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    }
  }

  static Future<void> popPage(context, {args}) async {
    await Navigator.maybePop(context, args);
  }
}
