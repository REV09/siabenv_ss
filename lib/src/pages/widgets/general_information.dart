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
    return Card();
  }
}
