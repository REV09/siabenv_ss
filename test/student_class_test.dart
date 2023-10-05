import 'package:flutter_test/flutter_test.dart';
import 'package:mibenv/src/domain/student_class.dart';

void main() {
  test("Prueba de unidad de los metodos set y get name", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setName("Hector David Madrid Rivera");
    expect(emptyStudent.getName(), "Hector David Madrid Rivera");
  });

  test("Prueba de unidad de los metodos set y get email", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setEmail("alguien.example@hotmail.com");
    expect(emptyStudent.getEmail(), "alguien.example@hotmail.com");
  });

  test("Prueba de unidad de los metodos set y get alternativeEmail", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setAlternativeEmail("alguien.example@hotmail.com");
    expect(emptyStudent.getAlternativeEmail(), "alguien.example@hotmail.com");
  });

  test("Prueba de unidad de los metodos set y get curp", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setCurp("MARH001028HVZDVCA2");
    expect(emptyStudent.getCurp(), "MARH001028HVZDVCA2");
  });

  test("Prueba de unidad de los metodos set y get bornDate", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setBornDate("28/10/2000");
    expect(emptyStudent.getBornDate(), "28/10/2000");
  });

  test("Prueba de unidad de los metodos set y get gender", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setGender(true);
    expect(emptyStudent.getGender(), true);
  });

  test("Prueba de unidad de los metodos set y get tutor", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setTutor("Jorge Octavio Ocharan Hernandez");
    expect(emptyStudent.getTutor(), "Jorge Octavio Ocharan Hernandez");
  });

  test("Prueba de unidad de los metodos set y get degree", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setDegree("Licenciatura en Educacion fisica");
    expect(emptyStudent.getDegree(), "Licenciatura en Educacion fisica");
  });

  test("Prueba de unidad de los metodos set y get area", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setArea("Educacion Especial");
    expect(emptyStudent.getArea(), "Educacion Especial");
  });

  test("Prueba de unidad de los metodos set y get level", () {
    Student emptyStudent = Student.emptyStudent();
    emptyStudent.setLevel("Licenciatura");
    expect(emptyStudent.getLevel(), "Licenciatura");
  });

  test("Prueba de unidad del metodo fromJson", () {
    Map<String, dynamic> jsonStudent = {
      "name": "Hector David Madrid Rivera",
      "email": "alguien.example@hotmail.com",
      "alternativeEmail": "alguien.example@hotmail.com",
      "curp": "MARH001028HVZDVCA2",
      "bornDate": "28/10/2000",
      "gender": true,
      "tutor": "Jorge Octavio Ocharan Hernandez",
      "degree": "Licenciatura en Educacion fisica",
      "area": "Educacion especial",
      "level": "Licenciatura",
    };
    Student student = Student.fromJson(jsonStudent);
    bool validStudent = false;
    if (student.getName() == "Hector David Madrid Rivera" &&
        student.getEmail() == "alguien.example@hotmail.com" &&
        student.getAlternativeEmail() == "alguien.example@hotmail.com" &&
        student.getCurp() == "MARH001028HVZDVCA2" &&
        student.getGender() == true &&
        student.getTutor() == "Jorge Octavio Ocharan Hernandez" &&
        student.getDegree() == "Licenciatura en Educacion fisica" &&
        student.getArea() == "Educacion especial" &&
        student.getLevel() == "Licenciatura") {
      validStudent = true;
    }
    expect(validStudent, true);
  });
}
