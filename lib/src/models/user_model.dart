import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.uuidUsuario,
    required this.nome,
    required this.email,
    required this.status,
  });

  final String uuidUsuario;
  final String nome;
  final String email;
  final String status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuidUsuario: json["uuidUsuario"],
        nome: json["nome"],
        email: json["email"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "uuidUsuario": uuidUsuario,
        "nome": nome,
        "email": email,
        "status": status,
      };
}
