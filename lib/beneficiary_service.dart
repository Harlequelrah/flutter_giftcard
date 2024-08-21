import 'models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://10.0.2.2:5107/api';

class BeneficiaryService {
  static Future<BeneficiaryUser> fetchBeneficiaryUser(String accessToken,
      String id) async {
    final String url = '$baseUrl/Beneficiary/User/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return BeneficiaryUser.fromJson(jsonDecode(response.body));
    } else {
      String errorMessage;
      try {
        final errorResponse = jsonDecode(response.body);
        errorMessage = errorResponse['message'] ?? 'Une erreur est survenue';
      } catch (e) {
        errorMessage = 'Erreur inconnue: ${response.body}';
      }

      throw Exception('Failed to load beneficiary: $errorMessage');
    }
  }


  static Future<String> fetchQrCodeToken(String accessToken, String id) async {
    final String url = '$baseUrl/Beneficiary/Token/$id';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['token'];
    } else {
      throw Exception('Failed to load QRCodeToken');
    }
  }

  static Future<List<History>> fetchHistories(
      String accessToken, String idBeneficiary) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Beneficiary/history/$idBeneficiary'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> historiesJson = jsonResponse['\$values'];
      return historiesJson.map((json) => History.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load histories');
    }
  }
}
