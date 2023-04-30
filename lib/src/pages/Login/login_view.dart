import 'package:eshop_ticket/src/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 64),
                    Container(
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage('assets/images/logo_grande.png'),
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 64),
                    const Text('Email', textAlign: TextAlign.start),
                    const SizedBox(height: 4),
                    TextFormField(
                      validator: (String? value) {
                        if (controller.valueValidator(value)) {
                          return 'Digite um email';
                        }
                        return null;
                      },
                      controller: controller.emailController,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        hintText: 'exemplo@dominio.com',
                      ),
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black12,
                    ),
                    const SizedBox(height: 32),
                    const Text('Senha', textAlign: TextAlign.start),
                    const SizedBox(height: 4),
                    TextFormField(
                      validator: (String? value) {
                        if (controller.valueValidator(value)) {
                          return 'Digite sua senha';
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                        hintText: '••••••••••••',
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      obscureText: true,
                      obscuringCharacter: '•',
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black12,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.clickLogin(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const PurchaseHistory(),
                          //   ),
                          // );
                        },
                        child: const Text('Entrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
