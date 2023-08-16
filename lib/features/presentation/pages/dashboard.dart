import 'package:app_albukhari/features/presentation/cubits/dashboard/cubit_dashboard.dart';
import 'package:app_albukhari/features/presentation/cubits/dashboard/state_dashboard.dart';
import 'package:app_albukhari/features/presentation/pages/home/home.dart';
import 'package:app_albukhari/features/presentation/pages/home/settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../cubits/cubit/cubit_home_cubit.dart';
import '../theme/appcolors.dart';
import '../theme/appimages.dart';
import '../widget/empty_room.dart';
import 'bookmarks.dart';
import 'home/library.dart';

// class Dashboard extends StatefulWidget {
//   Dashboard({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _StateDashBoard();
//   }
// }

//class _StateDashBoard extends State<Dashboard> {
class Dashboard extends StatelessWidget {
  final pages = [const Library(), Home(), const Settings()];
  final daroodShariefArabic =
      "اَللّٰھُمَّ صَلِّ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا صَلَّیْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ اَللّٰھُمَّ بَارِکْ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا بَارَکْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ";

  Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.07;
    return Scaffold(
        bottomNavigationBar: BlocBuilder<CubitDashBoard, StateDB>(
          buildWhen: (previous, current) =>
              current is StateDBSelectionIconUpdation,
          builder: (context, state) {
            var defaultIndex = 1;
            if (state is StateDBSelectionIconUpdation) {
              defaultIndex = state.selected;
            }
            return _buildBottomNavigationBar(defaultIndex, context, size);
          },
        ),
        appBar: AppBar(
          // preferredSize: const Size.fromHeight(20), // Set this height
          actions: [
            InkWell(
              onTap: () {
                //  getBookmarks(context);
                moveToBookMark(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.bookmark_add,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            )
          ],
          title: Center(
            child: Text(
              AppConst.defaultMessages(DefaultMsg.appName),
              style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 25)),
            ),
          ),
        ),
        // title: Text(
        //   "Al Bukhari ♥️",
        //   style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 20)),
        // ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Marquee(
                    textDirection: TextDirection.rtl,
                    text: daroodShariefArabic,
                    style: GoogleFonts.robotoCondensed(
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    blankSpace: 100.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    // startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<CubitDashBoard, StateDB>(
                    buildWhen: (previous, current) =>
                        current is StateDBBottomMenuTapped,
                    builder: (context, state) {
                      var pageIndex = 1;
                      if (state is StateDBBottomMenuTapped) {
                        pageIndex = state.menuIndex;
                        BlocProvider.of<CubitDashBoard>(context)
                            .updateBottomMenuSelection(selected: pageIndex);
                      }
                      return pages[pageIndex];
                    },
                  );
                },
              ),
            )
          ],
        ));
  }

  _buildBottomNavigationBar(
      int currentIndex, BuildContext context, double size) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            activeIcon:
                AppImages.request(req: Images.library, h: size, w: size),
            icon:
                AppImages.request(req: Images.libraryDisable, h: size, w: size),
            label: "Library"),
        BottomNavigationBarItem(
            activeIcon: AppImages.request(req: Images.leaf, h: size, w: size),
            icon: AppImages.request(req: Images.leafDisable, h: size, w: size),
            label: "Hadits"),
        BottomNavigationBarItem(
            activeIcon: AppImages.request(req: Images.focus, h: size, w: size),
            icon: AppImages.request(req: Images.focusDisable, h: size, w: size),
            label: "Focus"),
      ],
      currentIndex: currentIndex,

      // fixedColor: Colors.blue,
      iconSize: 3,
      // selectedIconTheme: const IconThemeData(color: AppColors.red),
      unselectedItemColor: AppColors.grey1,
      selectedItemColor: AppColors.red,
      onTap: (value) {
        BlocProvider.of<CubitDashBoard>(context)
            .onClickBottomMenuItem(index: value);
      },
      selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 15),
    );
  }

  void controlPanel() {}

  void moveToBookMark(BuildContext context) {
    final haditData = BlocProvider.of<CubitHome>(context).getBookmarks();
    if (haditData != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Bookmarks(
                hadits: haditData,
              )));
    }
  }
}
