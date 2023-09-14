import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/principal_page.dart';
import 'package:mibenv/src/pages/widgets/input_text.dart';

import '../utils/responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  bool obscurePassword = true;
  Icon showPasswordIcon = const Icon(Icons.remove_red_eye);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    TextStyle loginButton = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(2.4),
    );

    ButtonStyle styleLoginButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade700,
      fixedSize: Size(
        responsive.dp(20),
        responsive.wp(0),
      ),
    );

    TextStyle mibenvStyle = TextStyle(
      color: Colors.blue.shade900,
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(6),
    );

    IconButton showHidePasswordButton = IconButton(
      onPressed: () {
        setState(() {
          if (obscurePassword) {
            obscurePassword = false;
            showPasswordIcon = const Icon(Icons.remove_red_eye_outlined);
          } else {
            obscurePassword = true;
            showPasswordIcon = const Icon(Icons.remove_red_eye);
          }
        });
      },
      icon: showPasswordIcon,
      iconSize: responsive.dp(4),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: responsive.wp(45),
                height: responsive.hp(30),
                child: Image.asset(
                  "lib/src/pages/images/logo_normal.png",
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "SIABENV",
                style: mibenvStyle,
              ),
              SizedBox(
                height: responsive.hp(1),
              ),
              SizedBox(
                width: responsive.wp(85),
                child: Form(
                  key: _loginKey,
                  child: Column(
                    children: <Widget>[
                      InputText(
                        fontSize: responsive.hp(2),
                        keyboardType: TextInputType.name,
                        label: "Usuario",
                        helperText: "CURP ej: ABCD123456EFGHIJK",
                      ),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InputText(
                              fontSize: responsive.hp(2),
                              keyboardType: TextInputType.visiblePassword,
                              label: "Contraseña",
                              obscureText: obscurePassword,
                              borderEnabled: true,
                              validator: (text) {
                                if (text!.length < 8) {
                                  return "Ingrese un usuario valido";
                                } else {
                                  return null;
                                }
                              },
                              suffixIcon: showHidePasswordButton,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PrincipalPage(),
                            ),
                          );
                        },
                        style: styleLoginButton,
                        child: Text(
                          "Iniciar sesion",
                          style: loginButton,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
