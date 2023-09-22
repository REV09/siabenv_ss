import 'package:flutter/material.dart';

class NotificationCardPortrait extends StatelessWidget {
  final String? title;
  final String? information;
  final ShapeBorder? shapeBorder;
  final double width;
  int? maxLines;

  NotificationCardPortrait({
    Key? key,
    this.title,
    this.information,
    this.shapeBorder,
    required this.width,
  }) : super(key: key);

  void setMaxLines(int? maxLines) {
    this.maxLines = maxLines;
  }

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
        Text(
          title!,
          style: titleStyle,
        ),
        Container(
          width: width,
          child: Text(
            information!,
            style: informationStyle,
            overflow: TextOverflow.clip,
            softWrap: true,
            maxLines: maxLines,
          ),
        ),
      ],
    );
    Column eventHour = Column(
      children: <Widget>[
        const Icon(
          Icons.access_time,
          size: 50,
        ),
        Text("14:00", style: informationStyle),
        const SizedBox(height: 10),
        Text("16:00", style: informationStyle),
      ],
    );

    Row rowAlingment = Row(
      children: <Widget>[
        const SizedBox(width: 12),
        eventHour,
        const SizedBox(width: 12),
        cardContent
      ],
    );

    Column dateColumn = Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          "Lunes 22 de enero de 2024",
          style: titleStyle,
        ),
        rowAlingment,
      ],
    );

    return Card(
      shadowColor: Colors.black,
      elevation: 15,
      shape: shapeBorder,
      child: dateColumn,
    );
  }
}
