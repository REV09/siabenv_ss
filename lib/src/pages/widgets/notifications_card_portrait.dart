import 'package:flutter/material.dart';
import 'package:mibenv/src/domain/notification_class.dart';

import '../../utils/responsive.dart';

class NotificationCardPortrait extends StatelessWidget {
  final NotificationEvent? notificationEvent;
  final ShapeBorder? shapeBorder;
  final double width;
  int? maxLines;

  NotificationCardPortrait({
    Key? key,
    this.notificationEvent,
    this.shapeBorder,
    required this.width,
  }) : super(key: key);

  void setMaxLines(int? maxLines) {
    this.maxLines = maxLines;
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    TextStyle titleStyle = TextStyle(
      fontSize: responsive.dp(2.6),
      fontWeight: FontWeight.bold,
    );

    TextStyle informationStyle = TextStyle(
      fontSize: responsive.dp(2.0),
    );

    Column cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          notificationEvent!.getTitle(),
          style: titleStyle,
        ),
        Container(
          //if we don't use Container the text won't fit in the card
          width: width,
          child: Text(
            notificationEvent!.getDescription(),
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
        Text(notificationEvent!.getSchedule().split("-")[0],
            style: informationStyle),
        const SizedBox(height: 10),
        Text(notificationEvent!.getSchedule().split("-")[1],
            style: informationStyle),
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
          notificationEvent!.getEventDate(),
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
