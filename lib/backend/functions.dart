import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technewsapp/utils/key.dart';

Future<List> fetchNews(String query) async {
  try {
    final response = await http.get(
      Uri.parse(
        'https://newsdata.io/api/1/latest?size=10&apikey=${access_Key.access_key}&q=$query',
      ),
    );
    Map result = jsonDecode(response.body);
    print('Fetched');
    return result['articles'];
  } catch (e) {
    print('Unexpected Error $e');
    return [];
  }
}
