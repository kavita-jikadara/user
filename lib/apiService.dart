import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService extends ChangeNotifier {
  Dio dio = Dio();
  // var url = "http://localhost/food_app_api";
  // var url = "http://localhost/php/food_app_api";
  var url = "https://foodapp.devganiya.com";

  Future<Map<String, dynamic>> getCall(slug) async {
    try {
      var response = await dio.get('$url/$slug');
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postCall(slug, data) async {
    try {
      print('$url/$slug');
      dio.options.followRedirects = true;
      dio.options.validateStatus = (status) {
        return status! < 400;
      };
      var response = await dio.post('$url/$slug', data: data);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data);
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
