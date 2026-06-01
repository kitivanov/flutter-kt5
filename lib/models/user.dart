class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  Map<String, String> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromJson(Map<String, String> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}