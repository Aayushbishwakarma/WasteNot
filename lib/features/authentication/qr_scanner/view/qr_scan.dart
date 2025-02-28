import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: const QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = 'Scan a QR code';
  bool isScanned = false;
  Map<String, dynamic> jsonData = {};
  bool isProcessing = false;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // "Choose from Gallery" button at the top
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            onPressed: _pickImageFromGallery,
            icon: const Icon(Icons.photo_library),
            label: const Text('Choose from Gallery'),
            style: ElevatedButton.styleFrom(

              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        // QR scanner section in the middle
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: [

              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.black,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
              if (isProcessing)
                Container(
                  color: Colors.black54,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),

        // JSON fields or initial view
        Expanded(
          flex: 3,
          child: isScanned ? _buildJsonFieldsView() : _buildInitialView(),
        ),
      ],
    );
  }

  /// This view shows the "Scan Again" button at the top of the "Scan a QR code" text.
  Widget _buildInitialView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isScanned = false;
                result = 'Scan a QR code';
                jsonData = {};
              });
              controller?.resumeCamera();
            },
            icon: const Icon(Icons.qr_code_scanner),
            label: const Text('Scan Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            result,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildJsonFieldsView() {
    num totalPoints = jsonData.entries.fold(
      0,
          (sum, entry) => sum + (entry.value['count'] * _getPointsPerItem(entry.key)),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recycling Data:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: jsonData.entries.map((entry) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      "Object Type: ${entry.key}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Object Count: ${entry.value['count']}\nPoints: ${entry.value['count'] * _getPointsPerItem(entry.key)}",
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Total Points: $totalPoints",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => Get.snackbar(
                'Claim Successful',
                'You have claimed $totalPoints points!',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Claim',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    setState(() {
      isProcessing = true;
    });
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
      final barcodes = await barcodeScanner.processImage(inputImage);
      if (barcodes.isNotEmpty) {
        _processQRData(barcodes.first.rawValue ?? '');
      } else {
        Get.snackbar('No QR Code Found', 'The image does not contain a valid QR code');
      }
      barcodeScanner.close();
    } catch (e) {
      Get.snackbar('Error', 'Failed to process image: ${e.toString()}');
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        _processQRData(scanData.code!);
      }
    });
  }

  void _processQRData(String data) {
    try {
      List<dynamic> parsedJson = jsonDecode(data);
      setState(() {
        jsonData = {
          for (var e in parsedJson)
            e['class']: {'count': (e['count'] as num).toInt()}
        };
        isScanned = true;
      });
      controller?.pauseCamera();
    } catch (_) {
      Get.snackbar('Invalid QR Code', 'QR does not contain valid JSON data');
    }
  }

  int _getPointsPerItem(String objectType) {
    return (objectType.toLowerCase() == 'plastic'
        ? 3
        : objectType.toLowerCase() == 'can'
        ? 2
        : 1);
  }
}
