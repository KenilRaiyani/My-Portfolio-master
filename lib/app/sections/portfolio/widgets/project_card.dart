import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysite/app/utils/project_utils.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/color/colors.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';

class ProjectCard extends StatefulWidget {
  final ProjectUtils project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        projectDetailsPopUp(
          context: context,
          banners: widget.project.banners,
          titles: widget.project.titles,
          description: widget.project.description,
          functionality: widget.project.functionality,
          technologyUsed: widget.project.technologyUsed,
          platformSupport: widget.project.platformSupport,
          availability: widget.project.availability,
          link: widget.project.link,
        );
      },
      // onTap: () {
      //   setState(() => isHover = !isHover);
      // },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: Responsive.isDesktop(context) ? 35.w : 70.w,
        height: 50.h,
        decoration: BoxDecoration(
          // gradient: isHover ? pinkpurple : grayBack,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: isHover ? const EdgeInsets.all(20) : EdgeInsets.zero,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.project.icons.asMap().entries.map((entry) {
                        int index = entry.key;
                        String iconPath = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child:  Container(
                                  width: height * 0.05,
                                  height: height * 0.05,
                                  color: whiteColor,
                                  child: Center(
                                    child: Image.network(
                                      iconPath,
                                      height: height * 0.030,
                                    ),
                                  ),
                                ),
                        );
                      }).toList(),
                    ),*/
                    SizedBox(height: height * 0.02),
                    Text(
                      widget.project.titles,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: theme.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      widget.project.description,
                      textAlign: TextAlign.center,
                      maxLines: Responsive.isMobile(context) || Responsive.isTablet(context) ? 4 : 10,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: theme.textColor, overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.1 : 1.0,
              child: Container(
                width: Responsive.isDesktop(context) ? 30.w : 70.w,
                height: 36.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.project.banners),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void projectDetailsPopUp({
  required BuildContext context,
  required String banners,
  required String titles,
  required String description,
  required List<String> functionality,
  required String technologyUsed,
  required List<String> platformSupport,
  required List<String> availability,
  String? link,
}) {
  Size size = MediaQuery.of(context).size;
  var theme = Theme.of(context);

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Popup',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          content: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Responsive.isMobile(context) || Responsive.isTablet(context)
                  ? Container(
                      height: size.height * 0.60,
                      width: size.width * 0.70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: theme.navBarColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: theme.brightness == Brightness.dark
                                  ? Colors.grey.withOpacity(0.6)
                                  : Colors.black.withOpacity(0.5),
                              offset: Offset(0, 8), // pushes the shadow down more
                              blurRadius: 25, // smoother edges
                              spreadRadius: 8,
                            ),
                          ],
                          image: DecorationImage(
                            image: const NetworkImage('assets/imgs/background_new.webp'),
                            opacity: state.isDarkThemeOn ? 0.4 : 0.2,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: NetworkImage(banners), fit: BoxFit.cover)),
                              ),
                              SizedBox(width: size.height * 0.03),
                              const SizedBox(height: 10),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        titles,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        description,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const Text(
                                            'Technology used:  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Image.network(technologyUsed, height: 25)
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const Text(
                                            'Platform support:  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 30,
                                              child: ListView.separated(
                                                itemCount: platformSupport.length,
                                                physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Image.network(platformSupport[index], height: 25);
                                                },
                                                separatorBuilder: (context, index) {
                                                  return const SizedBox(width: 13);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      if (availability.isNotEmpty) ...{
                                        Row(
                                          children: [
                                            const Text(
                                              'Availability:  ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: 30,
                                                child: ListView.separated(
                                                  itemCount: availability.length,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) {
                                                    return Image.network(availability[index], height: 25);
                                                  },
                                                  separatorBuilder: (context, index) {
                                                    return const SizedBox(width: 13);
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      }
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/close.svg',
                                        color: theme.textColor,
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: size.height * 0.60,
                      width: size.width * 0.70,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: theme.navBarColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: theme.brightness == Brightness.dark
                                  ? Colors.grey.withOpacity(0.6)
                                  : Colors.black.withOpacity(0.5),
                              offset: Offset(0, 8), // pushes the shadow down more
                              blurRadius: 25, // smoother edges
                              spreadRadius: 8,
                            ),
                          ],
                          image: DecorationImage(
                            image: const NetworkImage('assets/imgs/background_new.webp'),
                            opacity: state.isDarkThemeOn ? 0.4 : 0.2,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: size.height * 0.50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: NetworkImage(banners), fit: BoxFit.cover)),
                              ),
                              SizedBox(width: size.height * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: Text(
                                        titles,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Text(
                                          'Technology used:  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Image.network(technologyUsed, height: 25)
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Text(
                                          'Platform support:  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 30,
                                            child: ListView.separated(
                                              itemCount: platformSupport.length,
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Image.network(platformSupport[index], height: 25);
                                              },
                                              separatorBuilder: (context, index) {
                                                return const SizedBox(width: 13);
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    if (availability.isNotEmpty)
                                      Row(
                                        children: [
                                          const Text(
                                            'Availability:  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 30,
                                              child: ListView.separated(
                                                itemCount: availability.length,
                                                physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Image.network(availability[index], height: 25);
                                                },
                                                separatorBuilder: (context, index) {
                                                  return const SizedBox(width: 13);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/close.svg',
                                      color: theme.textColor,
                                      height: 10,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    );
            },
          ),
        ),
      );
    },
  );
}
