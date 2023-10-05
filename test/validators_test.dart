import 'package:flutter_test/flutter_test.dart';
import 'package:mibenv/src/utils/validators.dart';

void main() {
  test("Prueba de validacion de CURP exitosa del 2000 en adelante", () {
    String curp = "MARH001028HVZDVCA2";
    bool isValid = curpValidator(curp);
    expect(isValid, true);
  });

  test("Prueba de validacion de CURP exitosa de 1999 hacia atras", () {
    String curp = "MARA960122HVZDVN05";
    bool isValid = curpValidator(curp);
    expect(isValid, true);
  });

  test("Prueba de validacion de contraseña valida", () {
    String password = "AMD5600g-";
    bool isValid = validatePassword(password);
    expect(isValid, false);
  });

  test("Prueba de validacion de contraseña invalida", () {
    String password = "AMD5600g:";
    bool isValid = validatePassword(password);
    expect(isValid, true);
  });
}
