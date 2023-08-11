import 'package:flutter/material.dart';

class WidgetCareerPath extends StatelessWidget {
  const WidgetCareerPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          // if (index > 2) {
          //   basicLearner = false;
          // } else {
          //   basicLearner = true;
          // }
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 200,
              color: Colors.amber,
              // color: (basicLearner) ? Colors.amber : Colors.black,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 5,
                    height: 60,
                    color: Colors.amber,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.purple,
                    child: Center(
                        child: Text(
                      "Level${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 5,
                    height: 60,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
