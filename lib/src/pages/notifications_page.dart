import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/event_details_page.dart';
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
    String information = "Descripcion de prueba de informacion para la tarjeta "
        " de notificaciones sobre eventos y avisos de la BENV de manera"
        " extendida la idea es que la descripcion sea tan largan que no se pueda"
        " visualizar de manera completa en la tarjeta tradicional de avisos y "
        " en teoria esto ya deberia ser suficiente para poder ajustarlo a la"
        " tarjeta y que no se pueda visualizar completo";
    String title = "Evento de prueba";

    Responsive responsive = Responsive(context);

    eventsListPortrait.clear();
    eventsListLandscape.clear();

    eventsListPortrait.add(SizedBox(height: responsive.hp(8)));
    eventsListLandscape.add(SizedBox(height: responsive.hp(8)));
    for (int i = 0; i < 5; i++) {
      NotificationCardLandscape eventCardLandscape = NotificationCardLandscape(
        information: information,
        title: title,
        width: responsive.wp(70),
      );

      NotificationCardPortrait eventCardPortrait = NotificationCardPortrait(
        information: information,
        title: title,
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
                    title: title,
                    information: information,
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
                    title: title,
                    information: information,
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
        builder: (context, orientation) => orientation == Orientation.portrait
            ? portraitView(title, information, responsive)
            : landscapeView(title, information, responsive),
      ),
    );
  }

  SingleChildScrollView portraitView(
      String title, String information, Responsive responsive) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventsListPortrait,
      ),
    );
  }

  SingleChildScrollView landscapeView(
      String title, String information, Responsive responsive) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventsListLandscape,
      ),
    );
  }
}
