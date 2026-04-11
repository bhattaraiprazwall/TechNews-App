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

  Future<void> handleSearch(String query) async {
    setState(() {
      isLoading = true;
    });

    final data = await fetchNews(query);

    setState(() {
      articles = data;
      isLoading = false;
    });
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
                ? Center(child: CircularProgressIndicator())
                // 4. Show message if no articles yet
                : articles.isEmpty
                ? Center(child: Text('Search for something to read !'))
                // 5. Show the list of articles
                : Container(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<List>(future: fetchNews(query), builder: (context, snapshot) {
                    if(snapshot.hasData)
                    {
                      return ListView.builder(itemCount: snapshot.data!.length,itemBuilder:(context, index) {
                        final url=snapshot.data![index]['url'];
                        final imageUrl=snapshot.data![index]['urlToImage'] ?? Constants.imageUrl;
                        final title=snapshot.data![index]['title'];
                        final description =snapshot.data![index]['description'].toString();
                        final time =snapshot.data![index]['publisedAt'];
                        return Newsbox(imageUrl: imageUrl, title: title, time: time, description: description, url: url);

                        
                      }, );
                    }
                    else if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                  },),
                )
          ),
        ],
      ),
    );
  }
}
