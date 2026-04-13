import 'package:flutter/material.dart';
import 'package:technewsapp/backend/functions.dart';
import 'package:technewsapp/components/newsbox.dart';
import 'package:technewsapp/components/searchbox.dart';
import 'package:technewsapp/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List articles = [];
  bool isLoading = false;
  String currentQuery = '';

  Future<void> handleSearch(String query) async {
    // print("//////////////SEARCH CALLED:////////////// $query"); //
    setState(() {
      isLoading = true;
      currentQuery = query;
    });

    final data = await fetchNews(query);
    // print(
    //   "//////////////////DATA LENGTH///////////: ${data.length}",
    // );

    setState(() {
      articles = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    handleSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TechNewz'), centerTitle: true),
      body: Column(
        children: [
          // 1. Search box at the top
          Searchbox(onSearch: handleSearch),

          // 2. The rest of the body
          Expanded(
            child: isLoading
                // 3. Show spinner while fetching
                ? Center(child: CircularProgressIndicator.adaptive())
                // 4. Show message if no articles yet
                : articles.isEmpty
                ? Center(child: Text('Search for something to read !'))
                // 5. Show the list of articles
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];

                        final url = article['link'] ?? '';
                        final imageUrl =
                            article['image_url'] ?? Constants.imageUrl;
                        final title = article['title'];
                        final description =
                            article['description']?.toString() ?? '';
                        final time = article['publishedAt'] ?? '';

                        return Newsbox(
                          imageUrl: imageUrl,
                          title: title,
                          time: time,
                          description: description,
                          url: url,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
