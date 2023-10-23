import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_dev_test/components/button.dart';

class SuccessBooked extends StatelessWidget {
  const SuccessBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/success_animation.json',
                  width: 150, height: 150),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Agendado Correctamente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Button(
                width: double.infinity,
                title: 'Volver a la página de inicio',
                onPressed: () => Navigator.of(context).pushNamed('main'),
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
