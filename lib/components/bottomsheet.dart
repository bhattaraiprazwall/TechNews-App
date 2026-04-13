import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewsapp/components/components.dart';
import 'package:technewsapp/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showMyBottomSheet(
  BuildContext context,
  String title,
  String description,
  imageUrl,
  url,
) {
  showBottomSheet(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,

    context: context,
    builder: (context) {
      return MyBottomSheetLayout(
        title: title,
        description: description,
        imageUrl: imageUrl,
        url: url,
      );
    },
  );
}

// _launchUrl(String url) async {
//   if (await canLaunchUrlString(url)) {
//     await launchUrlString(url);
//   } else {
//     throw 'Couldn\'t launch url';
//   }
// }

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Couldn\'t launch url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageUrl, url;
  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(
              text: description,
              size: 16,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Button clicked');
                        print('url$url');
                        _launchUrl(url);
                      },
                    style: GoogleFonts.lato(color: Colors.blue.shade400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
