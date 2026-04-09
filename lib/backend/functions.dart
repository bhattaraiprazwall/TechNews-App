import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technewsapp/components/searchbox.dart';
import 'package:technewsapp/utils/key.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
      'https://newsdata.io/api/1/latest?size=10&apikey=${Key.key}&q='+Searchbox.searchController.text,
    ),
  );
  Map result = jsonDecode(response.body);  print('Fetched');
  return result['articles'];
}