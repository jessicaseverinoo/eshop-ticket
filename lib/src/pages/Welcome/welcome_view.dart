import 'package:eshop_ticket/src/pages/Login/login_view.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset("assets/images/welcome.png"),
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}

// Center(
//   child: ElevatedButton(
//     child: const Text('Login'),
//     onPressed: () {
//       // Navigate to second route when tapped.
//     },
//   ),
// ),
