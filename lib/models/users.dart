class User {
  int? id;
  String name;
  String email;
  String password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  // Constructor factory para crear una instancia de User desde un mapa (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Método para convertir un objeto User a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Incluimos el campo id
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
