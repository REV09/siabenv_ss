import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mibenv/src/domain/student_class.dart';
import 'package:mibenv/src/services/configuration.dart';

class ServiceRestStudent {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<Student> getStudentInformation(String curp) async {
    try {
      final response = await _dio.get("$urlApi/studentRoute");
      if (response.statusCode == 200) {
        _logger.i(response.data);
        return Student.emptyStudent();
      }
      _logger.i(response.data);
      return Student.emptyStudent();
    } catch (notFoundError) {
      return Student.emptyStudent();
    }
  }

  Future<Student> giveStudentInformation() async {
    bool test = Random().nextBool();
    Map<String, dynamic> jsonStudent = {
      "name": "Nombre completo de prueba",
      "email": "alguienexample@ejemplo.com",
      "alternativeEmail": "prueba@example.com.mx",
      "curp": "ABCD123456EFGHIJK0",
      "bornDate": "00/00/0000",
      "gender": true,
      "tutor": "Nombre de tutor de prueba",
      "degree": "Nombre de programa de prueba",
      "area": "Educacion especial",
      "level": "Licenciatura",
    };
    if (test) {
      return Student.fromJson(jsonStudent);
    }
    return Student.emptyStudent();
  }
}
