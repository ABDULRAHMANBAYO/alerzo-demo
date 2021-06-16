import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  RegisterUser(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  String email;
  String password;
  String firstName;
  String lastName;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
      email: json["email"],
      password: json["password"],
      firstName: json["firstName"],
      lastName: json["lastName"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      };
}
