// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:mobile_dev_test/utils/config.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Config.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profileExample1.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Dominique Quezada',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    )
                  ],
                ),
                Config.spaceSmall,
                //Info de la consulta
                ScheduleCard(),
                SizedBox(
                  height: 10,
                ),
                //Botón
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFe7e9c4),
                      ),
                      child: Text(
                        'Entrar a la consulta',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

//Schedule widget

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.calendar_today, color: Colors.white, size: 15),
            SizedBox(
              width: 5,
            ),
            Text('Lunes 23/10/2023',
                style: TextStyle(
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.access_alarm, color: Colors.white, size: 17),
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Text('9:00 AM', style: TextStyle(color: Colors.white)))
          ],
        ));
  }
}
