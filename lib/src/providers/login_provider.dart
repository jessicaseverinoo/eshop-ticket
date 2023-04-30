import 'dart:convert' as convert;

import 'package:eshop_ticket/src/models/user_model.dart';

class LoginProvider {
  static Future<UserModel?> login(String user, String password) async {
    final Map params = {
      "uuidUsuario": "123e4567-e89b-12d3-a456-426614174000",
      "email": user,
      "nome": "Jessica Severino",
      "status": "ATIVO"
    };
    final userData = convert.jsonEncode(params);
    // final url = Uri.http('eshopticket.herokuapp.com', '/login');
    // final header = {"Content-Type": "application/json"};
    // final response = await http.post(url, headers: header, body: body);

    if (userData.isNotEmpty) {
      return UserModel.fromJson(convert.jsonDecode(userData));
      // return UserModel.fromJson(convert.jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
