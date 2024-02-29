import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratorQRcode extends StatefulWidget {
  const GeneratorQRcode({super.key});

  @override
  State<GeneratorQRcode> createState() => _GeneratorQRcodeState();
}

class _GeneratorQRcodeState extends State<GeneratorQRcode> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generator QR Code '),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlController.text.isNotEmpty)
                QrImageView(
                  data: urlController.text,
                  size: 300,
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Data',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter Your Data'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Generate QR code'))
            ],
          ),
        ),
      ),
    );
  }
}
