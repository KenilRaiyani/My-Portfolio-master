import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

void launchMailClient() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'kcreation.i07@gmail.com',
    query: encodeQueryParameters(<String, String>{'subject': 'Hello', 'body': 'How are you?'}),
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication); // <-- important
  } else {
    print('Could not launch mail app');
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}

