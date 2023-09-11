import 'package:flutter/material.dart';

class GeneralInformationCard extends StatelessWidget {
  final List<String>? titles;
  final List<String>? information;
  final ShapeBorder? shapeBorder;

  const GeneralInformationCard({
    Key? key,
    this.titles,
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

    List<Widget> informationCardContent = List.empty(growable: true);
    informationCardContent.add(const SizedBox(height: 15));

    for (int i = 0; i < titles!.length; i++) {
      informationCardContent.add(Text(titles!.elementAt(i), style: titleStyle));
      informationCardContent
          .add(Text(information!.elementAt(i), style: informationStyle));
      informationCardContent.add(const SizedBox(height: 10));
    }

    Column cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: informationCardContent,
    );

    Row rowAlingment = Row(
      children: <Widget>[const SizedBox(width: 10), cardContent],
    );
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      shape: shapeBorder,
      child: rowAlingment,
    );
  }
}
