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
}
