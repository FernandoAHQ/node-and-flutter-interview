import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/articles_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ArticlesProvider extends ChangeNotifier {
  static const apiEndpointAll = '$baseURL/articles/all';
  static const apiEndpointSearch = '$baseURL/articles/search';
  bool isLoading = true;
  String error = '';
  ArticlesResponse articlesResponse =
      ArticlesResponse(articles: [], status: false);

  ArticlesResponse articlesSearchResponse =
      ArticlesResponse(articles: [], status: false);

  getData() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpointAll));

      if (response.statusCode == 200) {
        print('200');
        articlesResponse = ArticlesResponse.fromJson(jsonDecode(response.body));
        error = '';
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  searchArticles(String query) async {
    Map<String, String> queryParams = {
      'search': query,
    };

    try {
      Response response = await http
          .get(Uri.parse(apiEndpointAll).replace(queryParameters: queryParams));

      if (response.statusCode == 200) {
        print('200');
        articlesSearchResponse =
            ArticlesResponse.fromJson(jsonDecode(response.body));
        error = '';
      } else {
        print(error);
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
      print(error);
    }
    isLoading = false;
    notifyListeners();
  }
}
