import 'package:flutter/material.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/app_theme.dart';

class ZoomAnimations extends StatefulWidget {
  const ZoomAnimations({Key? key}) : super(key: key);

  @override
  State<ZoomAnimations> createState() => _ZoomAnimationsState();
}

class _ZoomAnimationsState extends State<ZoomAnimations> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    sizeAnimation = Tween(begin: 0.0, end: 0.2)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    //
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return SizedBox(
      width: size.width / 4,
      height: size.width / 4,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: Container(
          height: size.width * sizeAnimation.value,
          width: size.width * sizeAnimation.value,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                theme.secondaryColor.withOpacity(0.30),
                theme.secondaryColor,
                secondaryColor,
                // primaryColor.withOpacity(0.20)
              ],
            ),
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Responsive.isMobile == true ? Radius.circular(12) : Radius.circular(5),
              topRight: Responsive.isMobile == true ? Radius.circular(50) : Radius.circular(20),
              bottomLeft: Responsive.isMobile == true ? Radius.circular(50) : Radius.circular(20),
              bottomRight: Responsive.isMobile == true ? Radius.circular(12) : Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: size.width * sizeAnimation.value,
              width: size.width * sizeAnimation.value,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.only(
                  topLeft: Responsive.isMobile == true ? const Radius.circular(12) : Radius.circular(5),
                  topRight: Responsive.isMobile == true ? Radius.circular(50) : Radius.circular(20),
                  bottomLeft: Responsive.isMobile == true ? Radius.circular(50) : Radius.circular(20),
                  bottomRight: Responsive.isMobile == true ? Radius.circular(12) : Radius.circular(5),
                ),
                color: Colors.black.withOpacity(0.8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  image: NetworkImage('assets/imgs/colored_profile.webp'),
                ),
              ),
            ),
          ),
        ),
        /*child: CustomOutline(
          strokeWidth: 1,
          radius: size.width * 0.1,
          padding: const EdgeInsets.all(0),
          width: size.width * sizeAnimation.value,
          height: size.width * sizeAnimation.value,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.secondaryColor,
                theme.secondaryColor.withOpacity(0),
                theme.primaryColor.withOpacity(0.1),
                theme.primaryColor
              ],
              stops: const [
                0.2,
                0.4,
                0.6,
                1
              ]),
          child: Container(
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(5),
              ),
              color: Colors.black.withOpacity(0.8),
              image: const DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                // opacity: 0.10,
                image: AssetImage('assets/imgs/colored_profile.jpg'),
              ),
            ),
          ),
        ),*/
      ),
    );
  }
}
