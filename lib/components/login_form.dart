import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/button.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:mobile_dev_test/utils/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor,
              ),
            ),
            Config.spaceSmall,
            TextFormField(
                controller: _passController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.primaryColor,
                obscureText: obsecurePass,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Contraseña',
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: Config.primaryColor,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePass = !obsecurePass;
                        });
                      },
                      icon: obsecurePass
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black38,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black38,
                            )),
                )),
            Config.spaceSmall,
            Button(
              width: double.infinity,
              title: 'Iniciar Sesión',
              onPressed: () async {
                {
                  // Obtiene el correo electrónico y la contraseña ingresados por el usuario
                  final enteredEmail = _emailController.text;
                  final enteredPassword = _passController.text;

                  // Recupera todos los usuarios almacenados (Solo para el desarrollo y tener claro si se guardó)
                  final users = await UserStorage.getUsers();
                  for (final user in users) {
                    print('Id : ${user.id}');
                    print('Nombre: ${user.name}');
                    print('Email: ${user.email}');
                    print('Contraseña: ${user.password}');
                    print('-----'); // Separador entre usuarios
                  }

                  for (final user in users) {
                    if (user.email == enteredEmail &&
                        user.password == enteredPassword) {
                      // Guardar el nombre del usuario en SharedPreferences al iniciar sesión
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('username',
                          user.name);
                      // Credenciales válidas, redirige a la página principal
                      Navigator.of(context).pushNamed('/authenticated');
                      return;
                    }
                  }

                  // Si no se encontraron credenciales válidas, muestra un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Credenciales incorrectas'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              disable: false,
            )
          ],
        ));
  }
}
