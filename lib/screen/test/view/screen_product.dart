import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/api_product_reponse.dart';

class ScreenProduct extends StatefulWidget {
  const ScreenProduct({super.key});

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  Future<ApiProductResponse> productResponse() async {
    final url = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(url));
    final reponseData = jsonDecode(response.body);
    final data = ApiProductResponse.fromJson(reponseData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
