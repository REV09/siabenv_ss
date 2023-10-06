import 'package:flutter/material.dart';
import 'package:mibenv/src/domain/notification_class.dart';
import 'package:mibenv/src/utils/responsive.dart';
import 'widgets/notifications_card_landscape.dart';
import 'widgets/notifications_card_portrait.dart';

class EventDetailsPage extends StatefulWidget {
  NotificationEvent notificationEvent;

  EventDetailsPage({
    super.key,
    required this.notificationEvent,
  });

  @override
  State<EventDetailsPage> createState() => _EventDetailsPage();
}

class _EventDetailsPage extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? portraitView(responsive)
              : landscapeView(responsive),
        ),
      ),
    );
  }

  portraitView(Responsive responsive) {
    NotificationCardPortrait eventCardPortrait = NotificationCardPortrait(
      notificationEvent: widget.notificationEvent,
      width: responsive.wp(60),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: responsive.wp(90),
          height: responsive.hp(60),
          child: eventCardPortrait,
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
    );
  }

  landscapeView(Responsive responsive) {
    NotificationCardLandscape eventCardLandscape = NotificationCardLandscape(
      notificationEvent: widget.notificationEvent,
      width: responsive.wp(70),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: responsive.wp(73),
          height: responsive.hp(78),
          child: eventCardLandscape,
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
    );
  }
}
