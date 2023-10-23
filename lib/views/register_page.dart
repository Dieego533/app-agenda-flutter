import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/sign_up_form.dart';
import 'package:mobile_dev_test/utils/config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              // Barra superior
              height: 50,
              color: const Color(0xFF8daec3),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                  ),
                  const Text(
                    'Registro',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Config.spaceMedium,
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16), // Margen horizontal
              child: SignUpForm(), // Tu formulario de registro
            ),
          ],
        ),
      ),
    );
  }
}
