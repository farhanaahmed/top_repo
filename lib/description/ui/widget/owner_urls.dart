import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerUrls extends StatelessWidget {
  const OwnerUrls({super.key, required this.urlText, required this.url});

  final String urlText;
  final String url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: urlText,
          style: TextStyle(
            color: Colors.blueAccent,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse(url));
            }),
    );
  }
}
