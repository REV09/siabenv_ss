import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/widgets/option_button.dart';
import 'package:mibenv/src/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    TextStyle titleStyle = TextStyle(
        fontSize: responsive.dp(2.4),
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade700);

    BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [
        BoxShadow(
          color: Colors.deepOrange[400]!,
          offset: const Offset(0, 20),
          blurRadius: 30,
          spreadRadius: -5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepOrange[200]!,
          Colors.deepOrange[300]!,
          Colors.deepOrange[500]!,
          Colors.deepOrange[500]!,
        ],
        stops: const [
          0.1,
          0.3,
          0.9,
          1.0,
        ],
      ),
    );

    BoxDecoration decorationButton2 = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple[400]!,
          offset: const Offset(0, 20),
          blurRadius: 30,
          spreadRadius: -5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepPurple[200]!,
          Colors.deepPurple[300]!,
          Colors.deepPurple[500]!,
          Colors.deepPurple[500]!,
        ],
        stops: const [
          0.1,
          0.3,
          0.9,
          1.0,
        ],
      ),
    );

    BoxDecoration decorationButton3 = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [
        BoxShadow(
          color: Colors.blueAccent[400]!,
          offset: const Offset(0, 20),
          blurRadius: 30,
          spreadRadius: -5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blueAccent[200]!,
          Colors.blueAccent[400]!,
          Colors.blueAccent[700]!,
          Colors.blueAccent[700]!,
        ],
        stops: const [
          0.1,
          0.3,
          0.9,
          1.0,
        ],
      ),
    );

    BoxDecoration decorationButton4 = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(42)),
      boxShadow: [
        BoxShadow(
          color: Colors.yellow[400]!,
          offset: const Offset(0, 20),
          blurRadius: 30,
          spreadRadius: -5,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Colors.yellow[200]!,
          Colors.yellow[400]!,
          Colors.yellow[600]!,
          Colors.yellow[600]!,
        ],
        stops: const [
          0.1,
          0.3,
          0.9,
          1.0,
        ],
      ),
    );

    return Center(
      child: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? portraitView(
                responsive,
                titleStyle,
                decoration,
                decorationButton2,
                decorationButton3,
                decorationButton4,
              )
            : landscapeView(
                responsive,
                titleStyle,
                decoration,
                decorationButton2,
                decorationButton3,
                decorationButton4,
              ),
      ),
    );
  }

  Column portraitView(
    Responsive responsive,
    TextStyle titleStyle,
    BoxDecoration decoration,
    BoxDecoration decorationButton2,
    BoxDecoration decorationButton3,
    BoxDecoration decorationButton4,
  ) {
    return Column(
      children: [
        SizedBox(
          height: responsive.hp(6),
        ),
        Text(
          "Pagina principal",
          style: titleStyle,
        ),
        SizedBox(
          height: responsive.hp(2.5),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: responsive.wp(10),
            ),
            Column(
              children: <Widget>[
                OptionButton(
                  width: responsive.wp(35),
                  height: responsive.hp(20),
                  icon: Icons.history_toggle_off_outlined,
                  iconSize: responsive.dp(5),
                  textButton: "Horario de clases",
                  boxDecoration: decoration,
                ),
                SizedBox(
                  height: responsive.hp(2),
                ),
                OptionButton(
                  width: responsive.wp(35),
                  height: responsive.hp(20),
                  icon: Icons.notifications_sharp,
                  iconSize: responsive.dp(5),
                  textButton: "Notificaciones y avisos",
                  boxDecoration: decorationButton2,
                ),
              ],
            ),
            SizedBox(
              width: responsive.wp(9),
            ),
            Column(
              children: <Widget>[
                OptionButton(
                  width: responsive.wp(35),
                  height: responsive.hp(18),
                  icon: Icons.person,
                  iconSize: responsive.dp(5),
                  textButton: "Datos generales",
                  boxDecoration: decorationButton3,
                ),
                SizedBox(
                  height: responsive.hp(2),
                ),
                OptionButton(
                  width: responsive.wp(35),
                  height: responsive.hp(21),
                  icon: Icons.incomplete_circle,
                  iconSize: responsive.dp(5),
                  textButton: "Avance academico",
                  boxDecoration: decorationButton4,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget landscapeView(
    Responsive responsive,
    TextStyle titleStyle,
    BoxDecoration decoration,
    BoxDecoration decorationButton2,
    BoxDecoration decorationButton3,
    BoxDecoration decorationButton4,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: responsive.hp(6),
          ),
          Text(
            "Pagina principal",
            style: titleStyle,
          ),
          SizedBox(
            height: responsive.hp(2.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  OptionButton(
                    width: responsive.wp(30),
                    height: responsive.hp(32),
                    icon: Icons.history_toggle_off_outlined,
                    iconSize: responsive.dp(5),
                    textButton: "Horario de clases",
                    boxDecoration: decoration,
                  ),
                  SizedBox(
                    height: responsive.hp(8),
                  ),
                  OptionButton(
                    width: responsive.wp(30),
                    height: responsive.hp(32),
                    icon: Icons.notifications_sharp,
                    iconSize: responsive.dp(5),
                    textButton: "Notificaciones y avisos",
                    boxDecoration: decorationButton2,
                  ),
                ],
              ),
              SizedBox(
                width: responsive.hp(9),
              ),
              Column(
                children: <Widget>[
                  OptionButton(
                    width: responsive.wp(28),
                    height: responsive.hp(30),
                    icon: Icons.person,
                    iconSize: responsive.dp(5),
                    textButton: "Datos generales",
                    boxDecoration: decorationButton3,
                  ),
                  SizedBox(
                    height: responsive.hp(8),
                  ),
                  OptionButton(
                    width: responsive.wp(28),
                    height: responsive.hp(30),
                    icon: Icons.incomplete_circle,
                    iconSize: responsive.dp(5),
                    textButton: "Avance academico",
                    boxDecoration: decorationButton4,
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
