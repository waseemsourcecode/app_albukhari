import 'package:app_albukhari/features/presentation/pages/dashboard/dashboard_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../../cubits/dashboard/cubit_dashboard.dart';
import '../../cubits/dashboard/state_dashboard.dart';
import '../../theme/appcolors.dart';
import '../../theme/appimages.dart';
import '../../widget/empty_room.dart';
import '../home/home.dart';
import '../home/library.dart';
import '../home/settings.dart';

mixin   DashboardUI <Dashboard extends StatelessWidget > on   StatelessWidget  {
  final pages = [const Library(), Home(), const Settings()];
  final daroodShariefArabic =
      "اَللّٰھُمَّ صَلِّ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا صَلَّیْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ اَللّٰھُمَّ بَارِکْ عَلٰی مُحَمَّدٍ وَّعَلٰٓی اٰلِ مُحَمَّدٍ کَمَا بَارَکْتَ عَلٰٓی اِبْرَاھِیْمَ وَعَلٰٓی اٰلِ اِبْرَاھِیْمَ اِنَّکَ حَمِیْدٌ مَّجِیْدٌ";


  _requestIcon(Images imgName, double size){
    return  AppImages.request(req: imgName, h: size, w: size);
  }
  buildAppBar(BuildContext context){
    return  AppBar(
      actions: [
        InkWell(
          onTap: () {
            moveToBookMark( context);
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
    );
  }
  buildPageView(){
    return  PageView.builder(
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
    );

  }
  buildBottomNavigationBar(
      int currentIndex, BuildContext context ) {
    final size = MediaQuery.of(context).size.width * 0.07;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            activeIcon:_requestIcon(Images.library,size) ,
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

      iconSize: 3,
      unselectedItemColor: AppColors.grey1,
      selectedItemColor: AppColors.red,
      onTap: (value) {
        BlocProvider.of<CubitDashBoard>(context)
            .onClickBottomMenuItem(index: value);
      },
      selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 15),
    );
  }
buildDaroodHeading(){
    return   Padding(
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
    );
}

}