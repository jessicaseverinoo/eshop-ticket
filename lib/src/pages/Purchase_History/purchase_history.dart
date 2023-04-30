import 'package:eshop_ticket/src/pages/Purchase_Detail/purchase_detail.dart';
import 'package:flutter/material.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(title: const Text("Pedidos")),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF5F5F8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PurchaseDetail()),
                )
              },
              child: Card(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFE2E2E2)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("01/01/2023"),
                            Text(
                              "Comprar novamente",
                              style: TextStyle(
                                color: Color(0xFF0C6CDC),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/without-image.png'),
                          height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Notebook Inspiron 15 5000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("Entregue"),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Número do pedido: ",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(1),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "665436549",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(1),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
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
