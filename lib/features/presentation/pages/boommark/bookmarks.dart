import 'package:app_albukhari/core/global_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_albukhari/features/presentation/theme/appimages.dart';
import 'dart:math' as math;

import '../../../domain/usecases/usecase_bookmark.dart';


class Bookmarks extends StatelessWidget {

  Bookmarks({super.key, required this.hadits});
  final  List<BookMarkModel> hadits;
  final swipeController = CardSwiperController();
  final colorLimit = 300;
  int swipeLimit = 250;
  Color swipe = Colors.red;
  Image? randomImage;

  @override
  Widget build(BuildContext context) {
    printAtConsole(hadits.length);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bookmarks",
            style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 30)),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.red,
                size: 35,
              ),
            ),
          ),
        ),
        body: haditsBody(size));
  }

  Widget haditsBody(Size size) {
    return CardSwiper(
      controller: swipeController,
      onSwipeDirectionChange: (horizontalDirection, verticalDirection) {
        swipe = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
        // print(swipe.red);
        // print(swipe.green);
        // print(swipe.blue);
        swipeLimit = swipe.red + swipe.green + swipe.blue;
        randomImage = AppImages.randomImage(
            (size.width * 0.1), (size.width * 0.1), BoxFit.scaleDown);

        // print("\n\n");
      },
      cardsCount: hadits.length,
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
          Container(
        alignment: Alignment.center,
        // color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              //  offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            //Container(child: randomImage),
            Align(alignment: Alignment.topLeft, child: randomImage),
            Align(alignment: Alignment.bottomRight, child: randomImage),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          hadits.remove(hadits[index]);
                          toast("Removed");
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                      InkWell(
                        onTap: () {

                          //  getBookmarks(context);
                        },
                        child: const Icon(
                          Icons.share,
                          color: Colors.green,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20, right: 20, bottom: 50),
              child: Column(
                children: [
                  Text(
                    "   ${hadits[index].data.info}",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w800)),
                  ),
                  Text(
                    "${hadits[index].data.by}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w800)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        "${hadits[index].data.text}",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                                overflow: TextOverflow.fade,
                                // color: swipe,
                                color: (swipeLimit <= colorLimit)
                                    ? swipe
                                    : Colors.black,
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
