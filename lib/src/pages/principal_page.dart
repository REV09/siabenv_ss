import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/widgets/general_information.dart';

import '../utils/responsive.dart';

class PrincipalPage extends StatefulWidget {
  @override
  State<PrincipalPage> createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> personalInformationTitles = [
      "Nombre",
      "Correo",
      "Correo alternativo",
      "CURP",
      "Fecha de nacimiento",
      "Genero",
    ];

    List<String> personalInformationData = [
      "Nombre completo de prueba",
      "alguienexample@ejemplo.com",
      "prueba@example.com.mx",
      "ABCD123456EFGHIJK0",
      "00/00/0000",
      "Genero",
    ];

    List<String> academicInformationTitles = [
      "Tutor academico",
      "Programa",
      "Area",
      "Facultad",
      "Campus",
      "Nivel",
    ];

    List<String> academicInformationData = [
      "Nombre de tutor de prueba",
      "Nombre de programa de prueba",
      "Area de prueba",
      "Escuela normal veracruzana",
      "Xalapa",
      "Licenciatura",
    ];

    Responsive responsive = Responsive(context);

    TextStyle titleStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.blue.shade900,
    );

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
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: responsive.hp(5)),
                Text("Informacion personal", style: titleStyle),
                SizedBox(height: responsive.hp(1)),
                SizedBox(
                  width: responsive.wp(90),
                  height: responsive.hp(61),
                  child: GeneralInformationCard(
                    titles: personalInformationTitles,
                    information: personalInformationData,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Informacion academica", style: titleStyle),
                SizedBox(height: responsive.hp(1)),
                SizedBox(
                  width: responsive.wp(90),
                  height: responsive.hp(61),
                  child: GeneralInformationCard(
                    titles: academicInformationTitles,
                    information: academicInformationData,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: responsive.hp(5)),
              ],
            ),
          ),
        )
      ][currentPageIndex],
    );
  }
}
