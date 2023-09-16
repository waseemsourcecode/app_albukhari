import 'package:app_albukhari/core/global_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'dart:math' as math;

import '../../domain/models/model_albukhari.dart';
import '../cubits/cubit/cubit_home_cubit.dart';
import '../theme/appimages.dart';
class ModelHadithData {
  final bool bookmarked;
  final Hadith hadith;
  ModelHadithData({required this.bookmarked, required this.hadith});
}
class HaditCard extends StatelessWidget {
  const HaditCard(
      {super.key, required this.hadits, required this.showRemoveBtn});
  final bool showRemoveBtn;
  final List<ModelHadithData> hadits;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const colorLimit = 300;
    int swipeLimit = 250;
    Color swipe = Colors.red;
    Image? randomImage;
    // final randomColors = [];

    return CardSwiper(

      isLoop: true,
      onSwipe: (pre,next, direction) async {

        if(direction == CardSwiperDirection.right){

          return false;
        }
        return true;

      },
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
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        final data = hadits[index];
      return  Container(
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
                            bookMarkIt(data.hadith!, context);
                          },
                          child:   Icon(
                            (data.bookmarked)? Icons.bookmark_remove :  Icons.bookmark_add,
                            color:  (data.bookmarked)?  Colors.red : Colors.green,
                            size: 35,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            getBookmarks(data.hadith,context);
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
                      "   ${data.hadith.info}",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w800)),
                    ),
                    Text(
                      "${data.hadith.by}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w800)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "${data.hadith.text}",
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
        );

      }
        );
  }

  void bookMarkIt(Hadith hadith, BuildContext context) {
    BlocProvider.of<CubitHome>(context).bookmarkHadit(hadith);
  }

  void getBookmarks(Hadith hadith, BuildContext context)async  {
   final isWhatsAppAvail = await isInstalled();
      printAtConsole('Whatsapp Business is installed: $isWhatsAppAvail');
      if(isWhatsAppAvail){
        final data = "${hadith.info}\n${hadith.by}\n${hadith.text}";
        await WhatsappShare.share(
          text: data,
         // linkUrl: 'https://flutter.dev/',
          phone: '+919797332954',
        );
      }
    }
    //BlocProvider.of<CubitHome>(context).getBookmarks();
  }


