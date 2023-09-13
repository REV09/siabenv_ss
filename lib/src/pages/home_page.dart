import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/widgets/option_button.dart';
import 'package:mibenv/src/utils/responsive.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: responsive.hp(10),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: responsive.wp(5),
              ),
              Column(
                children: <Widget>[
                  OptionButton(
                    width: responsive.wp(40),
                    height: responsive.hp(20),
                    icon: Icons.history_toggle_off_outlined,
                    iconSize: responsive.dp(5),
                    textButton: "Horario de clases",
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  OptionButton(
                    width: responsive.wp(40),
                    height: responsive.hp(20),
                    icon: Icons.notifications_sharp,
                    iconSize: responsive.dp(5),
                    textButton: "Notificaciones y avisos",
                  ),
                ],
              ),
              SizedBox(
                width: responsive.wp(10),
              ),
              Column(
                children: <Widget>[
                  OptionButton(
                    width: responsive.wp(40),
                    height: responsive.hp(20),
                    icon: Icons.person,
                    iconSize: responsive.dp(5),
                    textButton: "Datos generales",
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  OptionButton(
                    width: responsive.wp(40),
                    height: responsive.hp(20),
                    icon: Icons.incomplete_circle,
                    iconSize: responsive.dp(5),
                    textButton: "Avance academico",
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
