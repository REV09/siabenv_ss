import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/widgets/general_information_card.dart';

import '../utils/responsive.dart';

class GeneralInformationPage extends StatelessWidget {
  const GeneralInformationPage({super.key});

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
      "Licenciatura",
      "Area",
      "Nivel",
    ];

    List<String> academicInformationData = [
      "Nombre de tutor de prueba",
      "Nombre de programa de prueba",
      "Educacion especial",
      "Licenciatura",
    ];

    Responsive responsive = Responsive(context);

    TextStyle titleStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.blue.shade900,
    );

    return Center(
      child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? portraitView(
                  responsive,
                  titleStyle,
                  personalInformationTitles,
                  personalInformationData,
                  academicInformationTitles,
                  academicInformationData,
                )
              : portraitLandscape(
                  responsive,
                  titleStyle,
                  personalInformationTitles,
                  personalInformationData,
                  academicInformationTitles,
                  academicInformationData,
                )),
    );
  }

  Widget portraitView(
    Responsive responsive,
    TextStyle titleStyle,
    List<String> personalInformationTitles,
    List<String> personalInformationData,
    List<String> academicInformationTitles,
    List<String> academicInformationData,
  ) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: responsive.hp(5)),
            Text("Informacion personal", style: titleStyle),
            SizedBox(height: responsive.hp(1)),
            SizedBox(
              width: responsive.wp(90),
              height: responsive.hp(67),
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
              height: responsive.hp(47),
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
    );
  }

  Widget portraitLandscape(
    Responsive responsive,
    TextStyle titleStyle,
    List<String> personalInformationTitles,
    List<String> personalInformationData,
    List<String> academicInformationTitles,
    List<String> academicInformationData,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: responsive.hp(5)),
                  Text("Informacion personal", style: titleStyle),
                  SizedBox(height: responsive.hp(1)),
                  SizedBox(
                    width: responsive.wp(45),
                    height: responsive.hp(120),
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
                ],
              ),
              SizedBox(width: responsive.wp(4)),
              Column(
                children: <Widget>[
                  Text("Informacion academica", style: titleStyle),
                  SizedBox(height: responsive.hp(1)),
                  SizedBox(
                    width: responsive.wp(45),
                    height: responsive.hp(90),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
