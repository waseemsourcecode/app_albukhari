import 'dart:math';

import 'package:flutter/material.dart';

enum Images { leaf, leafDisable, focus, focusDisable, library, libraryDisable }

class AppImages {
  static Image randomImage(double? h, double? w, BoxFit bf) {
    const base = "assets/images";

    final links = [
      "$base/rose.png",
      "$base/fig.png",
      "$base/fig1.png",
      "$base/leaf.png",
      "$base/lily-of-the-valley.png",
      "$base/olive-oil.png",
      "$base/olive-oil1.png",
      "$base/olives.png",
      "$base/olive-tree.png",
      "$base/rose3.png",
      "$base/rubber-fig.png",
      "$base/rose4.png",
      "$base/rose1.png"
    ];

    return Image.asset(
      links[Random().nextInt(links.length - 1)],
      height: h,
      width: w,
      fit: bf,
    );
  }

  static Image request(
      {required Images req, double? h, double? w, BoxFit bf = BoxFit.cover}) {
    const base = "assets/images";
    String? link;
    switch (req) {
      case Images.leaf:
        link = "$base/leaf.png";
      case Images.leafDisable:
        link = "$base/leaf_d.png";
      case Images.focus:
        link = "$base/vision.png";
      case Images.focusDisable:
        link = "$base/vision_d.png";
      case Images.library:
        link = "$base/bookshelf.png";
      case Images.libraryDisable:
        link = "$base/bookshelf_d.png";
    }
    return Image.asset(
      link,
      height: h,
      width: w,
      fit: bf,
    );
  }
}
