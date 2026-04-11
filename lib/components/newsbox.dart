import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewsapp/components/components.dart';
import 'package:technewsapp/utils/colors.dart';
import 'package:technewsapp/utils/text.dart';

class Newsbox extends StatelessWidget {
  final String imageUrl, title, time, description, url;
  const Newsbox({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: .cover,
                        ),
                        borderRadius: .circular(10),
                        color: Colors.yellow,
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return CircularProgressIndicator(color: AppColors.primary);
                  },
                  errorWidget: (context, url, error) {
                    return Icon(Icons.error);
                  },
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      ModifiedText(
                        text: title,
                        size: 16,
                        color: AppColors.white,
                      ),
                      SizedBox(height: 5),
                      ModifiedText(
                        text: time,
                        size: 12,
                        color: AppColors.lightwhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
