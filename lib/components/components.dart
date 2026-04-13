import 'package:flutter/material.dart';
import 'package:technewsapp/utils/colors.dart';
import 'package:technewsapp/utils/text.dart';

//news list divider widget
class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(color: AppColors.lightwhite),
    );
  }
}

//bottom sheet image widget
class BottomSheetImage extends StatelessWidget {
  final String imageUrl,title;
  const BottomSheetImage({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: .only(
                topLeft: .circular(20),
                topRight: .circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: .cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: .all(10),
              width: 300,
              child: BoldText(text: title, size: 18, color: Colors.white),
            ))
        ],
      ),
    );
  }
}
