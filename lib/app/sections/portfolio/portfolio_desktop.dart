import 'package:flutter/material.dart';
import 'package:mysite/app/sections/portfolio/widgets/view_more_project.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:sizer/sizer.dart';

import 'widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        children: [
          // const CustomSectionHeading(text: "\nProjects"),
          const CustomSectionHeading(
            text1: '\nProjects',
            coloredText: '',
            text2: '',
          ),
          Space.y(4.h)!,
          CustomSectionSubHeading(text: protfolioSubHeading),
          Space.y(9.h)!,
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 20,
            children: projectUtils
                .take(4)
                .toList()
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(project: e.value),
                )
                .toList(),
          ),
          const SizedBox(height: 70),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewMoreProjects()),
            ),
            onHover: (isHovering) {
              if (isHovering) {
                setState(() => isHover = true);
              } else {
                setState(() => isHover = false);
              }
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(color: isHover ? secondaryColor : null, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'View More Projects',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: isHover ? Colors.white : theme.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isHover ? Colors.white : theme.textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
