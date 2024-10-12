import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScannerScreen(),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String scanResult = 'Belum ada hasil scan';

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();  // Memulai scanning barcode
      setState(() {
        scanResult = result.rawContent;  // Menyimpan hasil scan
      });
    } catch (e) {
      setState(() {
        scanResult = 'Error saat scan: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hasil Scan:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(scanResult, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
