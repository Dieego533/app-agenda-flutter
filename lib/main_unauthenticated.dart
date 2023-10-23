import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/professional_card.dart';
import 'package:mobile_dev_test/models/users.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:mobile_dev_test/utils/user_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainUnauthenticated extends StatefulWidget {
  const MainUnauthenticated({super.key});

  @override
  State<MainUnauthenticated> createState() => _MainUnauthenticatedState();
}

class _MainUnauthenticatedState extends State<MainUnauthenticated> {
  List<User> profesionales = [];

  @override
  void initState() {
    loadProfesionales();
    super.initState();
  }

  Future<void> loadProfesionales() async {
    // Simula una carga demorada
    await Future.delayed(Duration(seconds: 2));

    final users = await UserStorage.getUsers();
    print('Profesionales cargados: $users');

    setState(() {
      profesionales = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => loadProfesionales(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 60,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xFF8daec3),
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Bienvenido',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.person, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Profesionales',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Config.spaceSmall,
                        Column(
                          children: profesionales.isNotEmpty
                              ? profesionales.map((user) {
                                  return ProfessionalCard(user: user);
                                }).toList()
                              : [
                                  const Text(
                                      'No hay profesionales registrados'),
                                ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
