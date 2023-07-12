class Register {
  final String username;
  final String email;

  final String password;

  final String firstName;

  final String lastName;

  final String phone;

  Register({
    required this.password,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
        password: json['password'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phone: json['phone']);
  }
}
