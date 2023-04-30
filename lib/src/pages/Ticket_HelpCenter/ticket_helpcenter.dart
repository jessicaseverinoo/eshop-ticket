import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class TicketHelpCenter extends StatefulWidget {
  final String subject;
  const TicketHelpCenter({super.key, required this.subject});

  @override
  State<TicketHelpCenter> createState() => _TicketHelpCenterState();
}

class _TicketHelpCenterState extends State<TicketHelpCenter> {
  ImagePicker picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  bool isVideo = false;
  String? _retrieveDataError;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(title: const Text("Detalhe do Pedido")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Expanded(
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
              const TextField(
                minLines: 8,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Color.fromARGB(255, 94, 94, 94),
                decoration: InputDecoration(
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
                child: const Text('Anexar imagens do produto'),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: _previewImages(),
              ),
            ],
          ),
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
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 2,
          ),
          itemCount: _imageFileList!.length,
          itemBuilder: (context, index) {
            return Image.file(File(_imageFileList![index].path));
          });
    } else if (_pickImageError != null) {
      return Text(
        'Ocorreu um erro ao anexar as imagens: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Você pode anexar até 10 imagens do produto.',
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
}
