import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/appointmen_card.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAuthenticated extends StatefulWidget {
  final SharedPreferences prefs;
  const MainAuthenticated({required this.prefs, Key? key}) : super(key: key);
  @override
  State<MainAuthenticated> createState() => _MainAuthenticatedState();
}

class _MainAuthenticatedState extends State<MainAuthenticated> {
  void _cerrarSesion(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); // Elimina el nombre de usuario almacenado
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Hola, ${widget.prefs.getString('username') ?? 'Nombre del profesional'}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'CerrarSesion') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Cerrar Sesión'),
                              content: Text(
                                  '¿Estás seguro de que deseas cerrar la sesión?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Cerrar Sesión'),
                                  onPressed: () {
                                    _cerrarSesion(context);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (value == 'Perfil') {
                        //Pagina de perfil por desarrollar
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Perfil',
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Perfil'),
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'CerrarSesion',
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Cerrar Sesión'),
                        ),
                      ),
                    ],
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profileExample1.png'),
                    ),
                  ))
                ],
              ),
              Config.spaceSmall,
              const Row(
                children: [
                  Text(
                    'Horas Agendadas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Config.spaceSmall,
              AppointmentCard(),
            ],
          ))),
    );
  }
}
