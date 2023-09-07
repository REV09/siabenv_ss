import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  @override
  State<PrincipalPage> createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue.shade500,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
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
        Container(
          color: Colors.blueGrey.shade800,
          alignment: Alignment.center,
          child: const Text("Notificaciones y avisos"),
        ),
        Container(
          color: Colors.teal.shade900,
          alignment: Alignment.center,
          child: const Text("Notificaciones y avisos"),
        )
      ][currentPageIndex],
    );
  }
}
