import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import 'widgets/notifications_card_landscape.dart';
import 'widgets/notifications_card_portrait.dart';

class notificationsPage extends StatefulWidget {
  @override
  State<notificationsPage> createState() => _notificationsPage();
}

class _notificationsPage extends State<notificationsPage> {
  @override
  Widget build(BuildContext context) {
    String information = "Descripcion de prueba de informacion para la tarjeta "
        "de notificaciones sobre eventos y avisos de la BENV";
    String title = "Evento de prueba";

    Responsive responsive = Responsive(context);
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
    List<SizedBox> eventsList = List.empty(growable: true);
    eventsList.add(SizedBox(height: responsive.hp(8)));
    for (int i = 0; i < 5; i++) {
      eventsList.add(
        SizedBox(
          width: responsive.wp(90),
          height: responsive.hp(32),
          child: NotificationCardPortrait(
            information: information,
            title: title,
            width: responsive.wp(60),
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.blue,
                width: 3,
              ),
            ),
          ),
        ),
      );
      eventsList.add(SizedBox(height: responsive.hp(2)));
    }
    eventsList.add(SizedBox(height: responsive.hp(5)));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventsList,
      ),
    );
  }

  SingleChildScrollView landscapeView(
      String title, String information, Responsive responsive) {
    List<SizedBox> eventList = List.empty(growable: true);
    eventList.add(SizedBox(height: responsive.hp(8)));

    for (int i = 0; i < 5; i++) {
      eventList.add(
        SizedBox(
          width: responsive.wp(60),
          height: responsive.hp(60),
          child: NotificationCardLandscape(
            information: information,
            title: title,
            width: responsive.wp(70),
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.blue,
                width: 3,
              ),
            ),
          ),
        ),
      );
      eventList.add(SizedBox(height: responsive.hp(2)));
    }
    eventList.add(SizedBox(height: responsive.hp(5)));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: eventList,
      ),
    );
  }
}
