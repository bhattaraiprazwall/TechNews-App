import 'package:flutter/material.dart';
import 'package:technewsapp/utils/colors.dart';

class Searchbox extends StatefulWidget {
  final Function(String)? onSearch;
  const Searchbox({super.key, this.onSearch});

  @override
  State<Searchbox> createState() => _SearchboxState();
}

class _SearchboxState extends State<Searchbox> {
  final TextEditingController searchController = TextEditingController(
    text: '',
  );

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search a keyword or a phrase',

                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              String query = searchController.text;

              // fetchNews(query);
              widget.onSearch?.call(query);
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.darkgrey,

                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}
