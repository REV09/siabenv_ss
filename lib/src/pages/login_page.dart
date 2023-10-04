import 'package:flutter/material.dart';
import 'package:mibenv/src/pages/principal_page.dart';
import 'package:mibenv/src/pages/widgets/input_text.dart';
import 'package:mibenv/src/utils/validators.dart';

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

  _validateLogin() {
    final isValid = _loginKey.currentState?.validate();
    if (isValid != null && isValid) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PrincipalPage(),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    TextStyle loginButtonPortrait = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(2.4),
    );

    TextStyle loginButtonLandscape = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(4.6),
    );

    ButtonStyle styleLoginButtonPortrait = ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade700,
      fixedSize: Size(
        responsive.wp(46),
        responsive.hp(6.5),
      ),
    );

    ButtonStyle styleLoginButtonLandscape = ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade700,
      fixedSize: Size(
        responsive.wp(25),
        responsive.hp(0),
      ),
    );

    TextStyle siabenvStylePortrait = TextStyle(
      color: const Color.fromRGBO(0, 60, 112, 1.0),
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(6),
      fontFamily: "Bengasi Bold",
    );

    TextStyle siabenvStyleLandscape = TextStyle(
      color: const Color.fromRGBO(0, 60, 112, 1.0),
      fontWeight: FontWeight.bold,
      fontSize: responsive.hp(12),
      fontFamily: "Bengasi Bold",
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
        child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? portraitView(
                  responsive,
                  siabenvStylePortrait,
                  showHidePasswordButton,
                  context,
                  styleLoginButtonPortrait,
                  loginButtonPortrait,
                )
              : landscapeView(
                  responsive,
                  siabenvStyleLandscape,
                  showHidePasswordButton,
                  context,
                  styleLoginButtonLandscape,
                  loginButtonLandscape,
                ),
        ),
      ),
    );
  }

  SingleChildScrollView portraitView(
      Responsive responsive,
      TextStyle mibenvStyle,
      IconButton showHidePasswordButton,
      BuildContext context,
      ButtonStyle styleLoginButton,
      TextStyle loginButton) {
    return SingleChildScrollView(
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
                    validator: (text) {
                      if (text!.trim().length < 18) {
                        return "Ingresa una curp completa";
                      }
                      if (text.contains(" ")) {
                        return "No incluyas espacios en blanco";
                      }
                      if (!curpValidator(text)) {
                        "CURP invalida";
                      }
                      return null;
                    },
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
                            if (text!.trim().length < 8) {
                              return "La contraseña es muy corta";
                            }
                            if (text.contains(" ")) {
                              return "No ingreses espacios";
                            }
                            if (validatePassword(text)) {
                              return "Caracteres especiales no validos";
                            }
                            return null;
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
                    onPressed: _validateLogin,
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
    );
  }

  Widget landscapeView(
      Responsive responsive,
      TextStyle mibenvStyle,
      IconButton showHidePasswordButton,
      BuildContext context,
      ButtonStyle styleLoginButton,
      TextStyle loginButton) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: responsive.wp(30),
                height: responsive.hp(85),
                child: Image.asset(
                  "lib/src/pages/images/logo_normal.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: responsive.hp(10),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "SIABENV",
                    style: mibenvStyle,
                  ),
                  SizedBox(
                    width: responsive.wp(50),
                    child: Form(
                      key: _loginKey,
                      child: Column(
                        children: <Widget>[
                          InputText(
                            fontSize: responsive.wp(1.8),
                            keyboardType: TextInputType.name,
                            label: "Usuario",
                            helperText: "CURP ej: ABCD123456EFGHIJK",
                            validator: (text) {
                              if (text!.trim().length < 18) {
                                return "Ingresa una curp completa";
                              }
                              if (text.contains(" ")) {
                                return "No incluyas espacios en blanco";
                              }
                              if (!curpValidator(text)) {
                                "CURP invalida";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: responsive.wp(2.3),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: InputText(
                                  fontSize: responsive.wp(1.8),
                                  keyboardType: TextInputType.visiblePassword,
                                  label: "Contraseña",
                                  obscureText: obscurePassword,
                                  borderEnabled: true,
                                  validator: (text) {
                                    if (text!.trim().length < 8) {
                                      return "La contraseña es muy corta";
                                    }
                                    if (text.contains(" ")) {
                                      return "No ingreses espacios";
                                    }
                                    if (validatePassword(text)) {
                                      return "Caracteres especiales no validos";
                                    }
                                    return null;
                                  },
                                  suffixIcon: showHidePasswordButton,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: responsive.hp(4),
                          ),
                          ElevatedButton(
                            onPressed: _validateLogin,
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
            ],
          ),
        ],
      ),
    );
  }
}
