import 'dart:async';
import 'dart:convert';
import 'package:appentusfluttertest/constants.dart';
import 'package:appentusfluttertest/modal/home_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<HomeModel>> fetchHomeData() async {
    final response = await http.get(Uri.parse(APPURLS.SAMPLE_URL));
    try {
      if (response.statusCode == 200) {
        List<HomeModel> list = parsePostsForHome(response.body);

        return list;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static List<HomeModel> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HomeModel>((json) => HomeModel.fromJson(json)).toList();
  }
}
