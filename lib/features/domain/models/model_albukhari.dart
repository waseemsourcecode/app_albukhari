class ModelAlBukhariEnglish {
  ModelAlBukhariEnglish({
    required this.name,
    required this.books,
  });

  final String? name;
  final List<Book> books;

  factory ModelAlBukhariEnglish.fromJson(Map<String, dynamic> json) {
    return ModelAlBukhariEnglish(
      name: json["name"],
      books: json["books"] == null
          ? []
          : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "books": books.map((x) => x.toJson()).toList(),
      };
}

class Book {
  Book({
    required this.name,
    required this.hadiths,
  });

  final String? name;
  final List<Hadith> hadiths;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json["name"],
      hadiths: json["hadiths"] == null
          ? []
          : List<Hadith>.from(json["hadiths"]!.map((x) => Hadith.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "hadiths": hadiths.map((x) => x.toJson()).toList(),
      };
}

class Hadith {
  Hadith({
    required this.info,
    required this.by,
    required this.text,
  });

  final String? info;
  final String? by;
  final String? text;

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      info: json["info"],
      by: json["by"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
        "info": info,
        "by": by,
        "text": text,
      };
}
