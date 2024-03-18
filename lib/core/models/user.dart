class User {
    String email;
    String name;
    String lastName;

    // Constructor para inicializar los datos del usuario
    User({
        required this.email,
        required this.name,
        required this.lastName,
    });

    // Método para convertir la respuesta JSON de la API a un objeto User
    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            email: json['email'],
            name: json['name'],
            lastName: json['last_name'],
        );
    }
}
