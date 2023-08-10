import 'dart:convert';
import 'dart:developer';

import 'package:app_albukhari/data/data_process.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model_albukhari.dart';

class PageHadits extends StatefulWidget {
  final List<Hadith> hadits;
  final String title;
  const PageHadits({super.key, required this.hadits, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<PageHadits> createState() => _PageHaditsState();
}

class _PageHaditsState extends State<PageHadits> {
  //List<ModelAlBukhariEnglish>? alBukhariData;
 
  @override
  void initState() {
    super.initState();
    onInit();
  }

  void onInit() async {
//     data?.forEach((element) {
//        print(element.name);
//     //    setState(() {
//      books?.add(element);
//   //});

//     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
        color: Colors.amberAccent,
        child: ListView.builder(
          itemCount: widget.hadits.length,
          itemBuilder: (context, index) {
            final data = widget.hadits?[index];
             print(data);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
              //  height: 50,
                child: ListTile(
                    title: Text(data?.by ?? "By"),
                    subtitle: Column(
                      children: [
                      //  Text(data?.info ?? "info"),
                        Text(data?.text ?? "Text")
                      ],
                    )),
              ),
            );
          },
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
