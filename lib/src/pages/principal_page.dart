import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/general_information_page.dart';
import 'package:mibenv/src/pages/home_page.dart';
import 'package:mibenv/src/pages/widgets/notifications_card.dart';

import '../utils/responsive.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    String information =
        "Descripcion de prueba de\ninformacion para la tarjeta "
        "de\nnotificaciones sobre eventos y\navisos de la BENV";

    String title = "Evento de prueba";

    Responsive responsive = Responsive(context);

    List<Widget> eventsList = List.empty(growable: true);
    eventsList.add(SizedBox(height: responsive.hp(8)));
    for (int i = 0; i < 5; i++) {
      eventsList.add(SizedBox(
        width: responsive.wp(95),
        height: responsive.hp(27),
        child: NotificationCard(
          information: information,
          title: title,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          ),
        ),
      ));
      eventsList.add(SizedBox(height: responsive.hp(2)));
    }
    eventsList.add(SizedBox(height: responsive.hp(5)));

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.redAccent.shade700,
        backgroundColor: Colors.grey.shade200,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Inicio",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications_sharp),
            icon: Icon(Icons.notifications_outlined),
            label: "Notificaciones y avisos",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Datos generales",
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        Container(
          color: Colors.indigo.shade800,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: eventsList,
            ),
          ),
        ),
        GeneralInformationPage(),
      ][currentPageIndex],
    );
  }
}
