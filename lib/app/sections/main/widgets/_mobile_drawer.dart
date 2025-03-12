part of '../main_section.dart';

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme
    var theme = Theme.of(context);
    return Drawer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: NavBarLogo()),
                  const Divider(),
                  ListTile(
                    leading: Image.network(
                      state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                      height: 24,
                      width: 24,
                      color: state.isDarkThemeOn ? Colors.white : Colors.black,
                    ),
                    title: Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
                    trailing: Switch(
                      value: state.isDarkThemeOn,
                      activeColor: const Color(0xFF95485a), // i use this only this place bcz library import issue
                      inactiveTrackColor: Colors.grey,
                      onChanged: (newValue) {
                        context.read<ThemeCubit>().updateTheme(newValue);
                      },
                    ),
                  ),
                  const Divider(),
                  ...NavBarUtils.names.asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            hoverColor: theme.primaryColor.withAlpha(70),
                            onPressed: () {
                              // scrollProvider.scrollMobile(e.key);
                              scrollProvider.jumpTo(e.key);
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading: Image.asset(NavBarUtils.images[e.key],
                                  color: state.isDarkThemeOn ? whiteColor : blackColor, height: 22, width: 22),

                              /*Icon(
                                NavBarUtils.images[e.key],
                                // color: theme.primaryColor,
                              ),*/
                              title: Text(
                                e.value,
                                // style: AppText.l1,
                              ),
                            ),
                          ),
                        ),
                      ),
                  /*Space.y(5.w)!,
                  ColorChageButton(
                    text: 'RESUME',
                    onTap: () {
                      openURL(resume);
                    },
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
