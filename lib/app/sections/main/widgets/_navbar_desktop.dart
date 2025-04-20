part of '../main_section.dart';

class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return BlurryContainer(
        borderRadius: BorderRadius.circular(0),
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        color: theme.navBarColor.withOpacity(0.70),
        child: Row(
          children: [
            const NavBarLogo(),
            Space.xm!,
            ...NavBarUtils.names.asMap().entries.map(
                  (e) => NavBarActionButton(
                    label: e.value,
                    index: e.key,
                  ),
                ),
            // Space.x!,
            InkWell(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                },
                child: Image.network(
                  state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                  height: 30,
                  width: 30,
                  color: state.isDarkThemeOn ? Colors.white : Colors.black,
                )),
            // Space.x!,
          ],
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return BlurryContainer(
        color: theme.navBarColor.withOpacity(0.65),
        borderRadius: BorderRadius.circular(0),
        padding: EdgeInsets.symmetric(horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
        child: Row(
          children: [
            IconButton(
              highlightColor: Colors.white54,
              onPressed: () {
                drawerProvider.key.currentState!.openDrawer();
              },
              // icon: const Icon(Icons.menu),
              icon: SvgPicture.asset("assets/icons/drawer_icons/menu.svg",
                  color: state.isDarkThemeOn ? Colors.white : Colors.black, height: 15, width: 15),
            ),
            Space.xm!,
            const NavBarLogo(),
            // Space.x1!,
          ],
        ),
      );
    });
  }
}
