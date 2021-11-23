import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl =
      "http://customer_server.maharah.neumtech.net/api/Vendors/testAPI";

  Future<List<dynamic>> fetchListViewData() async {
    try {
      final response = await get(Uri.parse(baseUrl), headers: {
        "Authorization":
            "CIGfMA0GCSqGSIb3DQEBAQdqDup1pgSc0tQUMQUAA4GNADCBiQKBgQD3apAg6H2i"
      });
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
