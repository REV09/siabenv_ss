import 'package:flutter/material.dart';
import 'package:mibenv/src/domain/notification_class.dart';
import 'package:mibenv/src/pages/event_details_page.dart';
import 'package:mibenv/src/services/service_rest_notification.dart';
import '../utils/responsive.dart';
import 'widgets/notifications_card_landscape.dart';
import 'widgets/notifications_card_portrait.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
  List<SizedBox> eventsListPortrait = List.empty(growable: true);
  List<SizedBox> eventsListLandscape = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    ServiceRestNotification serviceRestNotification = ServiceRestNotification();

    TextStyle reloadTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.white,
    );

    ButtonStyle reloadButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.shade900,
      fixedSize: Size(
        responsive.wp(46),
        responsive.hp(6.5),
      ),
    );

    TextStyle noAvailableStyle = const TextStyle(
      fontSize: 25,
      color: Colors.black,
    );

    return FutureBuilder(
      future: serviceRestNotification.getNotificationsDay(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          eventsListPortrait.clear();
          eventsListLandscape.clear();

          eventsListPortrait.add(SizedBox(height: responsive.hp(8)));
          eventsListLandscape.add(SizedBox(height: responsive.hp(8)));

          List<NotificationEvent> notificationsList = snapshot.data!;

          for (int i = 0; i < 5; i++) {
            NotificationEvent notificationEvent = NotificationEvent(
              title: notificationsList.elementAt(i).getTitle(),
              description: notificationsList.elementAt(i).getDescription(),
              eventDate: notificationsList.elementAt(i).getEventDate(),
              schedule: notificationsList.elementAt(i).getSchedule(),
              type: notificationsList.elementAt(i).getType(),
            );

            NotificationCardLandscape eventCardLandscape =
                NotificationCardLandscape(
              notificationEvent: notificationEvent,
              width: responsive.wp(70),
            );

            NotificationCardPortrait eventCardPortrait =
                NotificationCardPortrait(
              notificationEvent: notificationEvent,
              width: responsive.wp(60),
            );
            eventCardPortrait.setMaxLines(6);
            eventCardLandscape.setMaxLines(4);

            eventsListPortrait.add(
              SizedBox(
                width: responsive.wp(90),
                height: responsive.hp(32),
                child: InkWell(
                  child: eventCardPortrait,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailsPage(
                          notificationEvent: notificationEvent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

            eventsListLandscape.add(
              SizedBox(
                width: responsive.wp(60),
                height: responsive.hp(62),
                child: InkWell(
                  child: eventCardLandscape,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailsPage(
                          notificationEvent: notificationEvent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

            eventsListPortrait.add(SizedBox(height: responsive.hp(2)));
            eventsListLandscape.add(SizedBox(height: responsive.hp(2)));
          }
          eventsListPortrait.add(SizedBox(height: responsive.hp(5)));
          eventsListLandscape.add(SizedBox(height: responsive.hp(5)));

          return Center(
            child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? portraitView(responsive)
                      : landscapeView(responsive),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Notificaciones no disponibles por el momento",
                  style: noAvailableStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.hp(4)),
                ElevatedButton(
                  onPressed: () {},
                  style: reloadButtonStyle,
                  child: Text("Recargar", style: reloadTextStyle),
                )
              ],
            ),
          );
        }
      },
    );
  }

  SingleChildScrollView portraitView(Responsive responsive) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventsListPortrait,
      ),
    );
  }

  SingleChildScrollView landscapeView(Responsive responsive) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventsListLandscape,
      ),
    );
  }
}
