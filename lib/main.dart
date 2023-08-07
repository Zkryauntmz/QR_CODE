import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_sisecam/splash_screen.dart';
import 'Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ŞİŞECAM QR SCANNER ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        "/screen2": (context) => RouteTwo(
              url: '',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getResult = '';
  String logo = "assets/Images/Sisecam_Logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SISECAM QR Scanner',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/Images/Sisecam_Logo.png",
            ),
            const SizedBox(
              height: 75,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue[600],
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 60),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 15,
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2)),
                onPressed: () {
                  scanQRCode();

                  // print(getResult);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'SCAN QR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.qr_code)
                  ],
                )),
            const SizedBox(
              height: 50.0,
            ),
            //Text(getResult),
          ],
        ),
      )),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
        if (getResult.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("                   LÜTFEN QR KODU OKUTUNUZ ..."),
            ),
          );
          print('Değer Bos');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RouteTwo(
                url: getResult,
              ),
            ),
          );
        }
      });

      // print("QRCode_Result:--");
      //  print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
