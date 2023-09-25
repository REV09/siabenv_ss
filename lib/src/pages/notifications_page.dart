import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'widgets/notifications_card_landscape.dart';
import 'widgets/notifications_card_portrait.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
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
              eventCard.setMaxLines(null);
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: responsive.wp(90),
                          height: responsive.hp(60),
                          child: eventCard,
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
              eventCard.setMaxLines(null);
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: responsive.wp(90),
                          height: responsive.hp(80),
                          child: eventCard,
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
