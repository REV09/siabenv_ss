import 'package:flutter/material.dart';

import '../utils/dialog_box.dart';
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
        " de notificaciones sobre eventos y avisos de la BENV de manera"
        " extendida la idea es que la descripcion sea tan largan que no se pueda"
        " visualizar de manera completa en la tarjeta tradicional de avisos y "
        " en teoria esto ya deberia ser suficiente para poder ajustarlo a la"
        " tarjeta y que no se pueda visualizar completo";
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
      NotificationCardPortrait eventCard = NotificationCardPortrait(
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
      );
      eventCard.setMaxLines(6);

      eventsList.add(
        SizedBox(
          width: responsive.wp(90),
          height: responsive.hp(32),
          child: InkWell(
            child: eventCard,
            onTap: () {
              DetailsEventPortrait event = DetailsEventPortrait(
                notificationCardPortrait: eventCard,
                responsive: responsive,
              );
              event.showPortraitMode(context);
            },
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
      NotificationCardLandscape eventCard = NotificationCardLandscape(
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
      );

      eventCard.setMaxLines(4);

      eventList.add(
        SizedBox(
          width: responsive.wp(60),
          height: responsive.hp(60),
          child: InkWell(
            child: eventCard,
            onTap: () {
              DetailsEventPortrait event = DetailsEventPortrait(
                notificationCardLandscape: eventCard,
                responsive: responsive,
              );
              event.showLandscapeMode(context);
            },
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
