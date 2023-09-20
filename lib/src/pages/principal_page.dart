import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/general_information_page.dart';
import 'package:mibenv/src/pages/home_page.dart';
import 'package:mibenv/src/pages/notifications_page.dart';

//import '../utils/responsive.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Responsive responsive = Responsive(context);

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
          color: Colors.grey.shade400,
          alignment: Alignment.center,
          child: notificationsPage(),
        ),
        const GeneralInformationPage(),
      ][currentPageIndex],
    );
  }
}
