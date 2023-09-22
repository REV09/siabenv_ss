import 'package:flutter/material.dart';

class NotificationCardLandscape extends StatelessWidget {
  final String? title;
  final String? information;
  final ShapeBorder? shapeBorder;
  final double width;
  int? maxLines;

  NotificationCardLandscape({
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

    Row dateRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.access_time,
          size: 40,
        ),
        Text("13:00 - 15:00", style: informationStyle),
      ],
    );

    Column cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10),
        Text("Lunes 22 de enero de 2024", style: titleStyle),
        dateRow,
        Text(title!, style: titleStyle),
        Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 5, 0),
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

    return Card(
      shadowColor: Colors.black,
      elevation: 14,
      shape: shapeBorder,
      child: cardContent,
    );
  }
}
