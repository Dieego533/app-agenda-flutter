import 'package:flutter/material.dart';

class AppointmentModel {
  int id; // Un identificador único para cada cita
  final int idUsuario;
  final DateTime fecha;
  final String? hora;
  final String nombrePaciente;
  final String emailPaciente;
  final String telefonoPaciente;

  AppointmentModel({
    required this.id,
    required this.idUsuario,
    required this.fecha,
    required this.hora,
    required this.nombrePaciente,
    required this.emailPaciente,
    required this.telefonoPaciente,
  });

  // Constructor factory para crear una instancia de AppointmentModel desde un mapa (JSON)
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      idUsuario: json['idUsuario'],
      fecha: DateTime.parse(json['fecha']),
      hora: json['hora'].toString(),
      nombrePaciente: json['nombrePaciente'],
      emailPaciente: json['emailPaciente'],
      telefonoPaciente: json['telefonoPaciente'],
    );
  }

  // Método para convertir un objeto AppointmentModel a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'fecha': fecha.toIso8601String(),
      'hora': hora,
      'nombrePaciente': nombrePaciente,
      'emailPaciente': emailPaciente,
      'telefonoPaciente': telefonoPaciente,
    };
  }
}
