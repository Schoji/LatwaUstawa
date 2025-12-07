import 'package:latwe_ustawy/models/member_model.dart';
import 'package:latwe_ustawy/models/post_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class BackendService {
  static final BackendService _backendService = BackendService._internal();

  factory BackendService() {
    return _backendService;
  }

  final String membersEndpoint = "https://api.sejm.gov.pl/sejm/term10/MP";

  BackendService._internal();

  Future<List<PostModel>> fetchPosts() async {
    //tutaj będzie wysyłany requeścik :)
    // await Future.delayed(Duration(seconds: 1));
    final List<dynamic> json = await loadJsonFromAssets("assets/example.json");
    final List<PostModel> posts = json
        .map((jsonItem) => PostModel.fromJson(jsonItem))
        .toList();

    return posts;
  }

  Future<List<dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<List<MemberModel>> fetchMembers() async {
    final client = http.Client();
    try {
      final response = await client.get(Uri.parse(membersEndpoint));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as List<dynamic>;
        final members = decoded
            .map((jsonItem) => MemberModel.fromJson(jsonItem))
            .toList();
        return members;
      } else {
        throw Exception('Failed to load members: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }
}
