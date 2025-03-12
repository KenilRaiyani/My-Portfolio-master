import 'package:flutter/material.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({Key? key}) : super(key: key);

  @override
  ArrowOnTopState createState() => ArrowOnTopState();
}

class ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Positioned(
      bottom: 100,
      right: -7,
      child: EntranceFader(
        offset: const Offset(0, 20),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => scrollProvider.jumpTo(0),
                onHover: (isHovering) {
                  if (isHovering) {
                    setState(() => isHover = true);
                  } else {
                    setState(() => isHover = false);
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                      gradient: isHover ? pinkpurple : grayBack,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      boxShadow: isHover
                          ? [
                              const BoxShadow(
                                blurRadius: 12.0,
                                offset: Offset(2.0, 3.0),
                              )
                            ]
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/icons/arrow-up.png",
                        height: 3.h,
                        // color: isHover ? whiteColor : whiteColor,
                        color: whiteColor,
                      ),
                    )

                    /*   Icon(
                    Icons.arrow_back,
                    color: isHover ? blackColor : whiteColor,
                    size: 5.h,
                  ),*/
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
