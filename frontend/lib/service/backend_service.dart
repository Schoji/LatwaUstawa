import 'package:latwe_ustawy/models/post_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BackendService {
  static final BackendService _backendService = BackendService._internal();

  factory BackendService() {
    return _backendService;
  }

  BackendService._internal();

  Future<List<PostModel>> fetchPosts() async {
    //tutaj będzie wysyłany requeścik :)
    await Future.delayed(Duration(seconds: 1));
    final json = await loadJsonFromAssets("assets/example.json");
    final response = PostModel.fromJson(json);
    return [response];
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
