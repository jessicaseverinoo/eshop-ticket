import 'dart:convert' as convert;

import 'package:eshop_ticket/src/models/user_model.dart';

class LoginProvider {
  static Future<UserModel?> login(String user, String password) async {
    final Map userAdmin = {
      "codigoCliente": '3ab59c56-b11d-43e2-8496-5bc0f27c844f',
      "codigoPedido": '7e42699a-93f6-474a-8fb1-34f213a28bc5',
      "email": user
    };

    final Map userVisit = {
      "codigoCliente": '3ab59c56-b11d-43e2-8496-5bc0f27c844f',
      "codigoPedido": '7e42699a-93f6-474a-8fb1-34f213a28bc5',
      "email": user
    };

    final verifyUserAdmin = user == "admin@eshop.com" && password == "a1s2d3";
    final verifyUserVisit = user == "visit@eshop.com" && password == "a1s2d3";

    if (verifyUserAdmin) {
      final userDataAdmin = convert.jsonEncode(userAdmin);
      return UserModel.fromJson(convert.jsonDecode(userDataAdmin));
    }

    if (verifyUserVisit) {
      final userDataVisit = convert.jsonEncode(userVisit);
      return UserModel.fromJson(convert.jsonDecode(userDataVisit));
    }

    return null;

    // final userData = convert.jsonEncode(users);
    // final url = Uri.http('eshopticket.herokuapp.com', '/login');
    // final header = {"Content-Type": "application/json"};
    // final response = await http.post(url, headers: header, body: body);

    // if (userData.isNotEmpty) {
    //   return UserModel.fromJson(convert.jsonDecode(userData));
    //   // return UserModel.fromJson(convert.jsonDecode(response.body));
    // } else {
    //   return null;
    // }
  }
}
