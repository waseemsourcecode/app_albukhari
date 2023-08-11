import 'package:app_albukhari/data/data_process.dart';
import 'package:app_albukhari/features/presentation/pages/home.dart/home.dart';
import 'package:app_albukhari/features/presentation/pages/home.dart/settings.dart';

import 'package:flutter/material.dart';

import '../../../core/global_funcs.dart';
import '../../domain/models/model_albukhari.dart';
import '../theme/appcolors.dart';
import '../theme/appimages.dart';
import 'home.dart/library.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //List<ModelAlBukhariEnglish>? alBukhariData;

  List<Book>? books;
  @override
  void initState() {
    super.initState();
    onInit();
  }

  void onInit() async {
    books = [];
    books = await DataProcess.getBooksFromTheVolumes();
//     data?.forEach((element) {
//        print(element.name);
//     //    setState(() {
//      books?.add(element);
//   //});

//     });
    setState(() {});
  }

  final pages = [const Library(), const Home(), const Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          //   backgroundColor: Colors.black,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            //    _pageindex = index;
          },
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[_pageindex];
          },
        )

        //  Center(
        //     // Center is a layout widget. It takes a single child and positions it
        //     // in the middle of the parent.
        //     child: Container(
        //   color: Colors.amberAccent,
        //   child: ListView.builder(
        //     itemCount: books?.length,
        //     itemBuilder: (context, index) {
        //       final data = books?[index];

        //       //  print(alBukhariData);
        //       return InkWell(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => PageHadits(
        //                       hadits: data!.hadiths, title: data.name!)));
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             color: Colors.red,
        //             height: 50,
        //             child: Text(data?.name ?? "No name"),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // )),
        // // This trailing comma makes auto-formatting nicer for build methods.

        );
  }

  var _pageindex = 1;
  _buildBottomNavigationBar() {
    final size = MediaQuery.of(context).size.width * 0.07;
    // const centerSize = size * 1.5;

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
      currentIndex: _pageindex,

      // fixedColor: Colors.blue,
      iconSize: 3,
      // selectedIconTheme: const IconThemeData(color: AppColors.red),
      unselectedItemColor: AppColors.grey1,
      selectedItemColor: AppColors.red,
      onTap: (value) {
        printAtConsole('Bottom Press $value');
        //  onBottomTap(value);
        setState(() {
          _pageindex = value;
        });
      },
      selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 15),
    );
  }
  // _setBottomNavigation() {
  //   return BottomNavigationBar(
  //       selectedItemColor: Colors.green,
  //       unselectedItemColor: Colors.black,
  //       onTap: (value) {
  //         print("$value");
  //         setState(() {
  //           _pageindex = value;
  //         });
  //       },
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.library_books,
  //             ),
  //             label: 'Library'),
  //         BottomNavigationBarItem(
  //             activeIcon: Icon(
  //               Icons.home,
  //               color: Colors.green,
  //             ),
  //             icon: Icon(Icons.home),
  //             label: 'Hadits'),
  //         BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  //       ]);
  // }
}
