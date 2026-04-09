import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewsapp/utils/colors.dart';

class Searchbox extends StatefulWidget {
  const Searchbox({super.key});
  static TextEditingController searchController = TextEditingController(
    text: '',
  );

  @override
  State<Searchbox> createState() => _SearchboxState();
}

class _SearchboxState extends State<Searchbox> {
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
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  controller: Searchbox.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search a keyword or a phrase',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),

        Expanded(
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
      ],
    );
  }
}
