import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

void openURL(String url) async {
  if (!url.startsWith("http")) {
    url = "https://$url";
  }

  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Could not launch $url");
  }
}
