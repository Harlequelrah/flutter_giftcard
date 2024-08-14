import 'models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://192.168.0.113:5107/api';

class BeneficiaryService {
  static Future<BeneficiaryUser> fetchBeneficiaryUser(
      String accessToken, String id) async {
    final String url = '$baseUrl/Beneficiary/User/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      return BeneficiaryUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load beneficiary');
    }
  }
}
