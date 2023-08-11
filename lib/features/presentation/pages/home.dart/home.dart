import 'package:app_albukhari/core/global_funcs.dart';
import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:app_albukhari/features/presentation/theme/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math' as math;
import '../../../../data/data_process.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _StateHome();
}

bool basicLearner = true;

class _StateHome extends State<Home> {
  var colors = [
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.purple,
  ];
  List<Hadith>? hadits;
  List<Image>? groupsOfImages;
  @override
  void initState() {
    super.initState();
    onInit();
    swipeController.addListener(() {
      printAtConsole("any");
    });
  }

  void onInit() async {
    final data = await DataProcess.get30RandomHadits();

    hadits = [];
    groupsOfImages = [];
    hadits = data;
    setState(() {});
  }

  final swipeController = CardSwiperController();
  final colorLimit = 300;
  int swipeLimit = 250;
  Color swipe = Colors.red;
  Image? randomImage;
  final randomColors = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (hadits == null)
        ? Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text('2'),
          )
        : CardSwiper(
            controller: swipeController,
            onSwipeDirectionChange: (horizontalDirection, verticalDirection) {
              swipe = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
              // print(swipe.red);
              // print(swipe.green);
              // print(swipe.blue);
              swipeLimit = swipe.red + swipe.green + swipe.blue;
              randomImage = AppImages.randomImage((size.width * 0.5) - 20,
                  (size.width * 0.4) - 20, BoxFit.scaleDown);

              // print("\n\n");
            },
            cardsCount: hadits!.length,
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) =>
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
                  Align(alignment: Alignment.bottomRight, child: randomImage),
                  const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_add,
                              color: Colors.red,
                              size: 35,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.green,
                              size: 35,
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                    child: Text(
                      "${hadits![index].info}\n${hadits![index].by}\n${hadits![index].text}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          overflow: TextOverflow.fade,
                          // color: swipe,
                          color:
                              (swipeLimit <= colorLimit) ? swipe : Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
