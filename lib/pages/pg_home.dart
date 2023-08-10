import 'dart:convert';
import 'dart:developer';

import 'package:app_albukhari/data/data_process.dart';
import 'package:app_albukhari/pages/page_hadits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model_albukhari.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  
  //List<ModelAlBukhariEnglish>? alBukhariData;

List<Book>? books;
   @override
  void initState()  {
   
    super.initState();
     onInit();
   
  }
   
   void onInit() async {
  books  = [];
   books = await  DataProcess.getBooksFromTheVolumes();
//     data?.forEach((element) {
//        print(element.name);
//     //    setState(() {
//      books?.add(element);
//   //});
      
//     });
setState(() {
  
});
   
  
     
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
        child:  Container(color: Colors.amberAccent,
        child: ListView.builder(
          itemCount:books?.length,
          itemBuilder: (context, index) {
            final data = books?[index];
             
          //  print(alBukhariData);
          return InkWell(
            onTap: () {
                Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageHadits(hadits: data!.hadiths, title: data.name!)));
  
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.red,
              height: 50,
              child: Text(data?.name ?? "No name"),
              ),
            ),
          );
        },),)
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
