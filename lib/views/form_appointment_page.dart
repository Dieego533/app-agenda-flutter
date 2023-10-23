import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/appointment_form.dart';
import 'package:mobile_dev_test/utils/config.dart';

class FormAppointmentPage extends StatefulWidget {
  const FormAppointmentPage({super.key});

  @override
  State<FormAppointmentPage> createState() => _FormAppointmentState();
}

class _FormAppointmentState extends State<FormAppointmentPage> {
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
                    'Datos para agendar',
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
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16), // Margen horizontal
              child: AppointmentForm(),
            ),
          ],
        ),
      ),
    );
  }
}
