import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:app_albukhari/features/presentation/cubits/slide_page/cubit_slide_page.dart';
import 'package:app_albukhari/features/presentation/cubits/slide_page/cubit_slide_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:spring/spring.dart';

class BookView extends StatefulWidget {
  final List<Hadith> hadits;
final String bookName;
  const BookView({super.key, required this.hadits, required this.bookName});
  @override
  _MyAppState createState() => _MyAppState();
}

// const double _MinNumber = 0.008;
// double _clampMin(double v) {
//   if (v < _MinNumber && v > -_MinNumber) {
//     if (v >= 0) {
//       v = _MinNumber;
//     } else {
//       v = -_MinNumber;
//     }
//   }
//   return v;
// }

class _MyAppState extends State<BookView> {
  //GlobalKey<FlipWidgetState> _flipKey = GlobalKey();

  // Offset _oldPosition = Offset.zero;
  // bool _visible = true;

  @override
  void initState() {
    super.initState();
  }
  final SpringController springController =
  SpringController( );
  @override
  Widget build(BuildContext context) {
    Size size = const Size(256, 256);
    return

      Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title:   Text(widget.bookName),
        ),
        body:Column(
          children: [
            Expanded(child: _buildFlip()),
            TextButton(onPressed: (){
              springController.play();
            }, child: Text("Next",style: TextStyle(color: Colors.white),))
          ],
        )
   );

  }
 Widget _buildFlip(){




    ;
    return    Center(
      child: Spring.flip(
        springController: springController,
        frontWidget: Container(
          height: double.infinity,
          color: Colors.red,child: Center(child:
        BlocBuilder<CubitSlidePage, CubitSlidePageState>(

            builder: (context, state)
            {
              int pgNo = 0;
              if(state is onPageSlide){
pgNo = state.index;
              }
              return   Text( widget.hadits[pgNo].text ?? "No hadit available",


                style: TextStyle(color: Colors.black,fontSize: 20),);
            }

        )

      ),), //required
        rearWidget: Container(color: Colors.green,), ////required
        flipAxis: Axis.horizontal, //def=Axis.horizantal
        onTap: (side) {
          //only Motion.play and anim Duration are accepted here.
          springController.play();
          print(side); //front or rear
        //  setState(() {cR
        //     if(pgNo == widget.hadits.length){
        //       pgNo = 0;
        //     }else{
        //       pgNo += 1;
        //     }
          BlocProvider.of<CubitSlidePage>(context).onSwipe();
        //  });

        },
        //you can disable flip on click
        toggleOnClick: false, //def=true
        animDuration: const Duration(seconds: 2), //def=1s
      ),
    );
  }

}
