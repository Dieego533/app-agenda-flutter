import 'package:flutter/material.dart';
import 'package:mobile_dev_test/models/users.dart';
import 'package:mobile_dev_test/utils/config.dart';

class ProfessionalCard extends StatelessWidget {
  final User user;

  const ProfessionalCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 150,
        child: GestureDetector(
          child: Card(
              elevation: 5,
              color: Colors.white,
              child: Row(children: [
                SizedBox(
                    width: Config.widthSize * 0.33,
                    child: Image.asset(
                      'assets/profileExample1.png',
                      fit: BoxFit.fill,
                    )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Nutricionista', // Profesión estática
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            Config.spaceSmall,
                            Text('4.5'), // Calificación estática
                            SizedBox(width: 8),
                            Text('Evaluaciones'),
                            SizedBox(width: 3),
                            Text('20'), // Número de evaluaciones estático
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ])),
          onTap: () {
            Navigator.of(context).pushNamed('/booking', arguments: user.id);
          },
        ));
  }
}
