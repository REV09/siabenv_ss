import 'package:flutter/material.dart';
import 'package:mibenv/src/utils/responsive.dart';

import '../pages/widgets/notifications_card_landscape.dart';
import '../pages/widgets/notifications_card_portrait.dart';

class DetailsEventPortrait {
  final NotificationCardPortrait? notificationCardPortrait;
  final NotificationCardLandscape? notificationCardLandscape;
  final Responsive responsive;

  const DetailsEventPortrait({
    required this.responsive,
    this.notificationCardPortrait,
    this.notificationCardLandscape,
  });

  showPortraitMode(BuildContext context) {
    notificationCardPortrait!.setMaxLines(null);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: responsive.wp(90),
                height: responsive.hp(60),
                child: notificationCardPortrait,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cerrar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showLandscapeMode(BuildContext context) {
    notificationCardLandscape!.setMaxLines(null);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: responsive.wp(80),
                height: responsive.hp(80),
                child: notificationCardLandscape,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cerrar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
