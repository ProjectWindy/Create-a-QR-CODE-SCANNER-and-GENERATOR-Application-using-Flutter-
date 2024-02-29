import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQRcode extends StatefulWidget {
  const ScanQRcode({super.key});

  @override
  State<ScanQRcode> createState() => _GeneratorQRcodeState();
}

class _GeneratorQRcodeState extends State<ScanQRcode> {

    String qrResult = 'Scanned Data   appear here';
    Future<void> scanQR() async {
      try {
        final qrCode = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        if (!mounted) return;
        setState(() {
          if (qrCode != '-1') {
            qrResult = qrCode;
            print(qrResult);
            print(qrResult);
          } else {
            qrResult = 'Fail to read QR';
          }
        });
      } on PlatformException {
        setState(() {
          qrResult = 'Fail to read QR';
        });
      }
    }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              qrResult,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: scanQR, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
