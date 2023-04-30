import 'package:eshop_ticket/src/pages/Ticket_HelpCenter/ticket_helpcenter.dart';
import 'package:flutter/material.dart';

class PurchaseDetail extends StatefulWidget {
  const PurchaseDetail({super.key});

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      elevation: 0.0,
      alignment: Alignment.centerLeft,
      textStyle: const TextStyle(fontSize: 13),
      backgroundColor: const Color(0xFFFFFFFF),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(title: const Text("Detalhe do Pedido")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Image(
                    image: AssetImage('assets/images/without-image.png'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 4),
                    Text(
                      "Notebook Inspiron 15 5000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("R\$4999,00"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 32),
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
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Status do pedido: ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(1),
                    ),
                  ),
                  TextSpan(
                    text: "Em andamento",
                    style: TextStyle(
                      color: Colors.black.withOpacity(1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Ajuda com a compra",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Recebi o produto com um problema',
                      ),
                    ),
                  );
                },
                child: const Text('Recebi o produto com um problema'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Recebi o pacote sem o produto',
                      ),
                    ),
                  );
                },
                child: const Text('Recebi o pacote sem o produto'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Tive um problema com o motorista',
                      ),
                    ),
                  );
                },
                child: const Text('Tive um problema com o motorista'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Quero devolver o produto',
                      ),
                    ),
                  );
                },
                child: const Text('Quero devolver o produto'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Quero trocar o endereço da compra',
                      ),
                    ),
                  );
                },
                child: const Text('Quero trocar o endereço da compra'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketHelpCenter(
                        subject: 'Outro',
                      ),
                    ),
                  );
                },
                child: const Text('Outro'),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(18, 217, 227, 0.4),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PurchaseDetail()),
                );
              },
              child: const Text('Falar com um atendente'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: const BorderSide(color: Color(0xFF12D9E3)),
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PurchaseDetail()),
                );
              },
              child: const Text('Detalhe da compra'),
            )
          ],
        ),
      ),
    );
  }
}
