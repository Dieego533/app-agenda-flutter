import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/button.dart';
import 'package:mobile_dev_test/models/users.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:mobile_dev_test/utils/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  int nextUserId = 1;

  // Método para obtener el próximo ID de usuario
  Future<void> getNextUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final lastUserId = prefs.getInt('lastUserId') ?? 0; // Obtener el último ID
    nextUserId = lastUserId + 1; // Incrementar el ID
    await prefs.setInt('lastUserId', nextUserId); // Guardar el nuevo ID
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  void initState() {
    super.initState();
    getNextUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Nombre de usuario',
              labelText: 'Nombre de usuario',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email',
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
                hintText: 'Contraseña',
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
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: 'Registrarse',
            onPressed: () async {
              // Obtener los valores de los campos de entrada
              final newUser = User(
                id: nextUserId,
                name: _nameController.text,
                email: _emailController.text,
                password: _passController.text,
              );
              // Guardar los datos localmente
              await UserStorage.saveUser(newUser);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text(
                      'Registro exitoso',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  backgroundColor: Config.primaryColor,
                ),
              );
              // Redirigir a la página principal
              Navigator.of(context).pushNamed('/login');
            },
            disable: false,
          )
        ],
      ),
    );
  }
}
