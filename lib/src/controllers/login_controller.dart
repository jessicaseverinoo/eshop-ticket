import 'package:eshop_ticket/src/models/user_model.dart';
import 'package:eshop_ticket/src/pages/Purchase_History/purchase_history.dart';
import 'package:eshop_ticket/src/providers/login_provider.dart';
import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void clickLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var usuario = await LoginProvider.login(
        emailController.text,
        passwordController.text,
      );

      if (usuario != null) {
        navigateToHomePage(context: context, userModel: usuario);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados de login inválidos'),
          ),
        );
      }
    }
  }

  void navigateToHomePage({
    required BuildContext context,
    required UserModel userModel,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PurchaseHistory(),
      ),
    );
  }
}
