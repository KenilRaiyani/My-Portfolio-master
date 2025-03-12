import 'package:flutter/material.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';

import '../../core/color/colors.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text1;
  final String coloredText;
  final String text2;

  const CustomSectionHeading(
      {Key? key,
      required this.text1,
      required this.coloredText,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: coloredText,
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      tablet: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: coloredText,
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      mobile: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: coloredText,
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                )),
            TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      /*Text(
        text,
        style: const TextStyle(fontSize: 56),
      ),
      tablet: Text(
        text,
        style: const TextStyle(fontSize: 36),
      ),
      mobile: Text(
        text,
        style: const TextStyle(fontSize: 26),
      ),*/
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Responsive(
      desktop: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.6),
          fontSize: 18,
        ),
      ),
      tablet: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.6),
          fontSize: 16,
        ),
      ),
      mobile: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.6),
          fontSize: 13,
        ),
      ),
    );
  }
}
