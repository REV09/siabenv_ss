import 'package:flutter/material.dart';

class GeneralInformationCard extends StatelessWidget {
  final String? fullName;
  final String? email;
  final String? alternativeEmail;
  final String? curp;
  final String? bornDate;
  final String? gender;

  const GeneralInformationCard({
    Key? key,
    this.fullName,
    this.email,
    this.alternativeEmail,
    this.curp,
    this.bornDate,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column cardContent = Column(
      children: <Widget>[
        const Text("Nombre"),
        Text(fullName!),
        const Text("Correo electronico"),
        Text(email!),
        const Text("Correo electronico alternativo"),
        Text(alternativeEmail!),
        const Text("CURP"),
        Text(curp!),
        const Text("Fecha de nacimiento"),
        Text(bornDate!),
        const Text("Genero"),
        Text(gender!),
      ],
    );
    return Card(
      color: Colors.white,
      child: cardContent,
    );
  }
}
