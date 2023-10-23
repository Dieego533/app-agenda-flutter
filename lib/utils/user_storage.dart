import 'package:mobile_dev_test/models/appointment_model.dart';
import 'package:mobile_dev_test/models/users.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  // Guardar un nuevo usuario
  static Future<void> saveUser(User newUser) async {
    final prefs = await SharedPreferences.getInstance();

    // Recuperar la lista de usuarios existente
    final users = prefs.getStringList('users') ?? [];

    // Serializar el nuevo usuario a una cadena JSON
    final userJson = json.encode(newUser.toJson());

    // Agregar la cadena JSON del nuevo usuario a la lista
    users.add(userJson);

    // Guardar la lista completa nuevamente en SharedPreferences
    await prefs.setStringList('users', users);
  }

  // Recuperar todos los usuarios
  static Future<List<User>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userStrings = prefs.getStringList('users') ?? [];

    // Convertir los datos guardados nuevamente a objetos User
    final users = userStrings
        .map((userString) => User.fromJson(json.decode(userString)))
        .toList();

    return users;
  }

  static const _keyAppointments = 'appointments';

  static Future<int> getLastAppointmentId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final appointments = prefs.getStringList(_keyAppointments) ?? [];

    // Verificar si hay citas en la lista
    if (appointments.isNotEmpty) {
      // Obtener la última cita de la lista y extraer su ID
      final lastAppointmentJson = jsonDecode(appointments.last);
      final lastAppointment = AppointmentModel.fromJson(lastAppointmentJson);
      return lastAppointment.id;
    }

    // Si la lista está vacía, el primer ID será 1
    return 1;
  }

  static Future<void> saveAppointment(AppointmentModel appointment) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final appointments = prefs.getStringList(_keyAppointments) ?? [];

    // Obtener el nuevo ID basado en el último ID de cita
    final newId = await getLastAppointmentId() + 1;

    // Asignar el nuevo ID a la cita antes de guardarla
    appointment.id = newId;

    // Agregar la cita a la lista de citas
    appointments.add(jsonEncode(appointment.toJson()));

    // Guardar la lista de citas actualizada
    await prefs.setStringList(_keyAppointments, appointments);
  }

  static Future<List<AppointmentModel>> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final appointments = prefs.getStringList(_keyAppointments) ?? [];
    return appointments.map((json) {
      final data = jsonDecode(json);
      return AppointmentModel.fromJson(data);
    }).toList();
  }
}
