class Book {
  String title;
  String author;
  int year;

  Book({required this.title, required this.author, required this.year});
}

// Inheritance
class BookFunny extends Book {
  String type;
  BookFunny({
    required super.title,
    required super.author,
    required super.year,
    this.type = "Funny",
  });
}
