import 'package:flutter/material.dart';
import 'main.dart';
import 'authentication_service.dart';
import 'beneficiary_service.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final String IdUser;
  const HomePage({super.key, required this.IdUser});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late BeneficiaryUser beneficiary = new BeneficiaryUser(
      idBeneficiary: 0,
      nomComplet: 'Username',
      email: 'username@example.com',
      solde: 'XOF 0.00');
  late String accessToken;
  late String IdUser;

  @override
  void initState() {
    super.initState();
    IdUser = widget.IdUser;
    _loadTokenAndData();
  }

  Future<void> _fetchData() async {
    try {
      final BeneficiaryUser fetchedbeneficiary =
          await BeneficiaryService.fetchBeneficiaryUser(accessToken, IdUser);
      setState(() {
        beneficiary = fetchedbeneficiary;
      });
    } catch (e) {
      print('Failed to load beneficiary $e');
    }
  }

  Future<void> _loadTokenAndData() async {
    final String? token = await getToken();
    if (token != null) {
      setState(() {
        accessToken = token;
      });
      await _fetchData();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.person,
              color: Colors.orange[900],
              size: 30,
            ),
          ),
        ),
        title: Image.asset('assets/gochaplogo.png', height: 20),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.orange[900]),
              onPressed: () async {
                await logout(context);
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade900,
                    Colors.orange.shade800,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beneficiary.nomComplet,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          beneficiary.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white54,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          beneficiary.solde,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.account_balance_wallet,
                                color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "solde",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildFeatureButton(
                    icon: Icons.history,
                    label: 'Historique',
                    onTap: () {},
                  ),
                  _buildFeatureButton(
                    icon: Icons.shopping_cart,
                    label: 'Achat',
                    onTap: () {
                      // Logique d'achat
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange[900]),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
