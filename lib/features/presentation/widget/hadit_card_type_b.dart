import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

import '../../../core/global_funcs.dart';

class HadithCardTypeB extends StatelessWidget {
  const HadithCardTypeB({super.key, required this.hadits});
  final List<Hadith> hadits;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hadits.length,
      itemBuilder: (_, i) {
        final data = hadits[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Text(
                        '${data.by}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${data.text}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){

                          },color: Colors.red, icon:const Icon( Icons.favorite)),
                        IconButton(onPressed: (){
                          share(data,context);
                        },color: Colors.green, icon:const Icon( Icons.share))
                      ],)
                    ],
                  ),
                ],
              )),
        );
      },
    );

    // CarouselSlider(
    //     options: CarouselOptions(
    //      // height: 500,
    //      // aspectRatio: 16/9,
    //     //  viewportFraction: 0.8,
    //       initialPage: 0,
    //       enableInfiniteScroll: true,
    //       reverse: false,
    //       autoPlay: false,
    //       autoPlayInterval: const Duration(seconds: 3),
    //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //       autoPlayCurve: Curves.fastOutSlowIn,
    //       enlargeCenterPage: false,
    //    //   enlargeFactor: 0.3,
    //     //  onPageChanged: callbackFunction,
    //       scrollDirection: Axis.vertical,
    //     ),
    //   items: hadits.map((i) {
    //     return Builder(
    //       builder: (BuildContext context) {
    //         return Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Container(
    //               width: MediaQuery.of(context).size.width,
    //               margin: const EdgeInsets.all(5.0),
    //               decoration:   BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(10),
    //                 topRight: Radius.circular(10),
    //                 bottomLeft: Radius.circular(10),
    //                 bottomRight: Radius.circular(10)
    //             ),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey.withOpacity(0.5),
    //                 spreadRadius: 5,
    //                 blurRadius: 7,
    //                 offset: const Offset(0, 3), // changes position of shadow
    //               ),
    //             ],
    //           ),
    //               child: Wrap(
    //                 children: [        Column(children: [
    //                   Text('${i.by}', style: const TextStyle(color: Colors.green, fontSize: 18.0,fontWeight: FontWeight.bold),)
    //                   ,
    //                   Padding(
    //
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Text('${i.text}', style: const TextStyle(color: Colors.black, fontSize:20.0),),
    //                   )
    //                 ],),],
    //
    //               )
    //
    //
    //           ),
    //         );
    //       },
    //     );
    //   }).toList(),
    // );
    //
  }
  void share(Hadith hadith, BuildContext context)async  {
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
}
