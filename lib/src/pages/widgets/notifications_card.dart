import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String? title;
  final String? information;
  final ShapeBorder? shapeBorder;

  const NotificationCard({
    Key? key,
    this.title,
    this.information,
    this.shapeBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
    );

    TextStyle informationStyle = const TextStyle(
      fontSize: 18,
    );

    Column cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title!, style: titleStyle),
        Text(information!, style: informationStyle),
        const SizedBox(height: 10),
      ],
    );
    Column eventHour = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15),
        const Icon(
          Icons.access_time,
          size: 60,
        ),
        const SizedBox(height: 15),
        Text("14:00", style: informationStyle),
        const SizedBox(height: 15),
        Text("16:00", style: informationStyle),
        const SizedBox(height: 10),
      ],
    );

    Row rowAlingment = Row(
      children: <Widget>[
        const SizedBox(width: 15),
        eventHour,
        const SizedBox(width: 15),
        cardContent
      ],
    );

    Column dateColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Lunes 22 de enero de 2024",
          style: titleStyle,
        ),
        rowAlingment,
      ],
    );
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      shape: shapeBorder,
      child: dateColumn,
    );
  }
}
