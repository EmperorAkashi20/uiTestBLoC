import 'dart:convert';

import 'package:http/http.dart';
import 'package:uitest_bloc/Data/Models/list_view_response_model.dart';

class NetworkService {
  final baseUrl =
      "http://customer_server.maharah.neumtech.net/api/Vendors/testAPI";

  Future<Map<String, dynamic>> fetchListViewData() async {
    try {
      final response = await get(Uri.parse(baseUrl), headers: {
        "Authorization":
            "CIGfMA0GCSqGSIb3DQEBAQdqDup1pgSc0tQUMQUAA4GNADCBiQKBgQD3apAg6H2i"
      });
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      // print(dataMap);
      Map<String, dynamic> servicesData = dataMap["data"];
      // print(servicesData);
      List<dynamic> servicesList = servicesData["services"];
      return dataMap;
      // return jsonDecode(response.body);
    } catch (e) {
      // print(e);
      // print(e);
      return {};
    }
  }
}
