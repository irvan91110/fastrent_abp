import 'dart:convert';

import 'package:get/get.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class Networkprovider extends GetConnect {
  late String baseURL = "http://192.168.1.14:8000/api";

  Networkprovider();

  Future<dynamic> datapost(endpoint, headers, dataBody) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/$endpoint'),
        headers: headers,
        body: dataBody,
      );
      return response;
    } catch (e) {
      // Tangani kesalahan di sini
      print('Error: $e');
    }
  }

  Future<dynamic> dataget(endpoint, header) async {
    var response = await http.get(
      Uri.parse('$baseURL/$endpoint'),
      headers: header,
      //jsonEncode(<String, String>{'name': "irvan", 'last': "ardiansyah"})
      //body: dataBody,
    );
    return jsonDecode(response.body);
  }
}
