import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.codigoCliente,
    required this.codigoPedido,
    required this.email,
  });

  final String codigoCliente;
  final String codigoPedido;
  final String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        codigoCliente: json["codigoCliente"],
        codigoPedido: json["codigoPedido"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "codigoCliente": codigoCliente,
        "codigoPedido": codigoPedido,
        "email": email,
      };
}
