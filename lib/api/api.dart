import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sentiment_analysis/model/model.dart';

class ApiService {
  static const _api_keys = "3c13bc9137msh5929c886857f0cap176589jsnd1f96d681d74";
  static const String _baseUrl =
      "https://twinword-sentiment-analysis.p.rapidapi.com/analyze/";
  static const Map<String, String> _header = {
    'content-type': 'application/x-www-form-urlencoded',
    'x-rapidapi-host': 'twinword-sentiment-analysis-v1.p.rapidapi.com',
    'x-rapidapi-key': _api_keys,
    'useQueryString': 'true',
  };

  Future<SentAna> post({required Map<String, String> query}) async {
    final response =
        await Dio().post(_baseUrl, queryParameters: _header, data: query);

    if (response.statusCode == 200) {
      print("success: ${response.data}");

      return SentAna.fromJson(jsonDecode(response.data));
    } else {
      throw Exception("Failed load json data");
    }
  }
}
