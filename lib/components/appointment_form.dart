import 'package:flutter/material.dart';
import 'package:mobile_dev_test/components/button.dart';
import 'package:mobile_dev_test/models/appointment_model.dart';
import 'package:mobile_dev_test/models/users.dart';
import 'package:mobile_dev_test/utils/config.dart';
import 'package:mobile_dev_test/utils/user_storage.dart';

class AppointmentForm extends StatefulWidget {
  final int? professionalId;
  final DateTime? selectedDate;
  final int? selectedTime;

  AppointmentForm({
    Key? key,
    this.professionalId,
    this.selectedDate,
    this.selectedTime,
  }) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
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
              hintText: 'Nombre Completo',
              labelText: 'Nombre',
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
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Telefono',
              labelText: 'Telefono',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.phone_callback_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: 'Agendar',
            onPressed: () async {
              final name = _nameController.text;
              final email = _emailController.text;
              final phone = _phoneController.text;
              final selectedTime = widget.selectedTime;

              final nextId = await UserStorage.getLastAppointmentId();

              final Map<String, dynamic>? arguments = ModalRoute.of(context)
                  ?.settings
                  .arguments as Map<String, dynamic>?;
              if (arguments != null) {
                final professionalId = arguments['professionalId'];
                final selectedDate = arguments['selectedDate'];
                final selectedTime = arguments['selectedTime'].toString();

                print(
                    "La hora sin formatear es ${arguments['selectedTime']} y la hora formateada es ${selectedTime}");

                final appointment = AppointmentModel(
                  id: nextId,
                  idUsuario: professionalId,
                  fecha: selectedDate,
                  hora: selectedTime,
                  nombrePaciente: name,
                  emailPaciente: email,
                  telefonoPaciente: phone,
                );

                // Ahora, guardar la cita
                await UserStorage.saveAppointment(appointment);
              }
              print(
                  "El selected date que llega aqui es ${widget.selectedDate} y la hora es ${widget.selectedTime}");

              UserStorage.getAppointments().then((appointments) {
                // Itera a través de la lista de citas y las imprime
                for (var appointment in appointments) {
                  print(appointment.toJson());
                }
              });

              // Redirigir a la página principal
              Navigator.of(context).pushNamed('/success_booking');
            },
            disable: false,
          )
        ],
      ),
    );
  }
}

TimeOfDay convertIndexToTime(int index) {
  final hour = 9 + index; // 9 AM + índice
  return TimeOfDay(hour: hour, minute: 0);
}
