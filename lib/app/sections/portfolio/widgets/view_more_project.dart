import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysite/app/sections/portfolio/widgets/project_card.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/apis/links.dart';
import '../../../../core/res/responsive.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';
import '../../../utils/navbar_utils.dart';
import '../../../widgets/navbar_actions_button.dart';
import '../../../widgets/navbar_logo.dart';

class ViewMoreProjects extends StatefulWidget {
  const ViewMoreProjects({Key? key}) : super(key: key);

  @override
  State<ViewMoreProjects> createState() => _ViewMoreProjectsState();
}

class _ViewMoreProjectsState extends State<ViewMoreProjects> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: NavbarDesktop(),
          mobile: NavbarDesktop(),
          tablet: NavbarDesktop(),
        ),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  'assets/imgs/background_new.webp',
                  // 'assets/imgs/light_background.webp',
                  // !state.isDarkThemeOn ? 'assets/imgs/background_new.webp' : 'assets/imgs/light_background.webp',
                  opacity: AlwaysStoppedAnimation<double>(state.isDarkThemeOn ? 0.6 : 0.2),
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              ListView(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 20,
                    children: projectUtils
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (e) => ProjectCard(project: e.value),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return BlurryContainer(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
        borderRadius: BorderRadius.circular(0),
        color: theme.navBarColor.withOpacity(0.70),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/back arrow.svg',
                      color: theme.textColor,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: Text(
              'Projects',
              style: TextStyle(color: theme.textColor, fontSize: 22, fontWeight: FontWeight.w600),
            )),
          ],
        ),
      );
    });
  }
}
