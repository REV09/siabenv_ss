import 'package:flutter/material.dart';
import 'package:mibenv/src/domain/student_class.dart';
import 'package:mibenv/src/pages/widgets/general_information_card.dart';
import 'package:mibenv/src/services/services_rest_student.dart';

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

    List<String> academicInformationTitles = [
      "Tutor academico",
      "Licenciatura",
      "Area",
      "Nivel",
    ];

    Responsive responsive = Responsive(context);

    TextStyle titleStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.blue.shade900,
    );

    TextStyle noAvailableStyle = const TextStyle(
      fontSize: 25,
      color: Colors.black,
    );

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

    ServiceRestStudent serviceRestStudent = ServiceRestStudent();

    return FutureBuilder(
      future: serviceRestStudent.giveStudentInformation(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.getName() != "") {
          Student student = snapshot.data!;
          return Center(
            child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? portraitView(
                          responsive,
                          titleStyle,
                          personalInformationTitles,
                          academicInformationTitles,
                          student,
                        )
                      : landscapeView(
                          responsive,
                          titleStyle,
                          personalInformationTitles,
                          academicInformationTitles,
                          student,
                        ),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "La informacion no se encuentra disponible en este momento",
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

  Widget portraitView(
      Responsive responsive,
      TextStyle titleStyle,
      List<String> personalInformationTitles,
      List<String> academicInformationTitles,
      Student student) {
    List<String> academicInformation = List.empty(growable: true);
    academicInformation.add(student.getTutor());
    academicInformation.add(student.getDegree());
    academicInformation.add(student.getArea());
    academicInformation.add(student.getLevel());
    List<String> personalInformation = List.empty(growable: true);
    personalInformation.add(student.getName());
    personalInformation.add(student.getEmail());
    personalInformation.add(student.getAlternativeEmail());
    personalInformation.add(student.getCurp());
    personalInformation.add(student.getBornDate());
    personalInformation.add(student.getGengerText());

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
              height: responsive.hp(55),
              child: GeneralInformationCard(
                titles: personalInformationTitles,
                information: personalInformation,
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
              height: responsive.hp(40),
              child: GeneralInformationCard(
                titles: academicInformationTitles,
                information: academicInformation,
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

  Widget landscapeView(
      Responsive responsive,
      TextStyle titleStyle,
      List<String> personalInformationTitles,
      List<String> academicInformationTitles,
      Student student) {
    List<String> academicInformation = List.empty(growable: true);
    academicInformation.add(student.getTutor());
    academicInformation.add(student.getDegree());
    academicInformation.add(student.getArea());
    academicInformation.add(student.getLevel());
    List<String> personalInformation = List.empty(growable: true);
    personalInformation.add(student.getName());
    personalInformation.add(student.getEmail());
    personalInformation.add(student.getAlternativeEmail());
    personalInformation.add(student.getCurp());
    personalInformation.add(student.getBornDate());
    personalInformation.add(student.getGengerText());
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
                    height: responsive.hp(118),
                    child: GeneralInformationCard(
                      titles: personalInformationTitles,
                      information: personalInformation,
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
                    height: responsive.hp(83),
                    child: GeneralInformationCard(
                      titles: academicInformationTitles,
                      information: academicInformation,
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
