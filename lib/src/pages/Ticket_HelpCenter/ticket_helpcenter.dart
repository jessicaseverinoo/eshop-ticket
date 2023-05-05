import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class TicketHelpCenter extends StatefulWidget {
  final String subject;
  final dynamic product;
  const TicketHelpCenter(
      {super.key, required this.subject, required this.product});

  @override
  State<TicketHelpCenter> createState() => _TicketHelpCenterState();
}

class _TicketHelpCenterState extends State<TicketHelpCenter> {
  ImagePicker picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  String? _retrieveDataError;
  final descriptionController = TextEditingController();

  Future getImageList() async {
    try {
      final List<XFile> pickedFileList = await picker.pickMultiImage(
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 100,
      );

      if (pickedFileList.isEmpty) return;

      setState(() {
        _imageFileList = pickedFileList;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(title: const Text("Detalhe do Pedido")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assunto",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              minLines: 1,
              maxLines: null,
              readOnly: true,
              cursorColor: const Color.fromARGB(255, 94, 94, 94),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: widget.subject,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Escreva uma mensagem para que possamos ajudar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              minLines: 8,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: const Color.fromARGB(255, 94, 94, 94),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Escreva aqui...',
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: const BorderSide(color: Color(0xFF12D9E3)),
                backgroundColor: const Color.fromARGB(255, 225, 253, 255),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                getImageList();
              },
              child: const Text('Anexar imagem do produto'),
            ),
            const SizedBox(height: 24),
            Container(
              child: _previewImages(),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(18, 217, 227, 0.4),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                fetchForm(descriptionController.text, context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Image.file(File(_imageFileList![0].path));
    } else if (_pickImageError != null) {
      return Text(
        'Ocorreu um erro ao anexar as imagens: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Você não anexou nenhuma imagem.',
        textAlign: TextAlign.center,
      );
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> fetchForm(String description, BuildContext context) async {
    try {
      final body = {
        "codigoCliente": "3ab59c56-b11d-43e2-8496-5bc0f27c844f",
        "codigoPedido": "7e42699a-93f6-474a-8fb1-34f213a28bc5",
        "descricao": description
      };
      final uri = Uri.parse(
          "https://api-cqrs-command.herokuapp.com/api-cqrs-command/v1/command/reclamacoes");
      final header = {"Content-Type": "application/json"};

      final response = await http.post(
        uri,
        headers: header,
        body: convert.jsonEncode(body),
      );

      final decodeResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (_imageFileList![0].path.isNotEmpty) {
          fetchImage(decodeResponse["codigoReclamacao"]);
        } else {
          // ignore: use_build_context_synchronously
          _showAlertDialog(
            context,
            "Sucesso",
            "Reclamação salva com sucesso!",
          );
        }
      } else {
        // ignore: use_build_context_synchronously
        _showAlertDialog(
          context,
          "Erro",
          "Não conseguimos enviar a reclamação",
        );
      }
    } catch (e) {
      _showAlertDialog(
        context,
        "Erro",
        "Houve um erro ao cadastrar a reclamação",
      );
    }
  }

  Future<void> fetchImage(String codeTicket) async {
    try {
      final uri = Uri.parse(
          "https://api-cqrs-command.herokuapp.com/api-cqrs-command/v1/command/reclamacoes/$codeTicket/imagens");
      final request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(
          'imagens', _imageFileList![0].path));
      final response = await request.send();

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        _showAlertDialog(
          context,
          "Sucesso",
          "Reclamação salva com sucesso!",
        );
      } else {
        // ignore: use_build_context_synchronously
        _showAlertDialog(
          context,
          "Erro",
          "Não conseguimos enviar a imagem",
        );
      }
    } catch (e) {
      _showAlertDialog(
        context,
        "Erro",
        "Houve um erro ao cadastrar a imagem",
      );
    }
  }

  void _showAlertDialog(
      BuildContext context, String title, String description) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Entendi'),
          ),
        ],
      ),
    );
  }
}
