import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'authentication_service.dart';

class PurchasePage extends StatelessWidget {
  final String accessToken;

  const PurchasePage({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achat'),
        backgroundColor: Colors.orange[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await GetBeneficiaryUser(context, accessToken);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Faites Scanner ce QRCode Pour Payer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<String>(
                future: Future.delayed(const Duration(seconds: 1),
                    () => accessToken),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('Aucune donnée');
                  } else {
                    return QrImageView(
                      data: snapshot.data!,
                      size: 200.0,
                      backgroundColor: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
