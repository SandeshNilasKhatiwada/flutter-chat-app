abstract class Login {
  final String name;
  final String password;

  const Login({
    required this.name,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "name": name,
      "password": password,
    };
  }
}
