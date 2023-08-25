class Book {
  String title;
  String author;
  String description;
  String publisher;
  String publishDate;
  int pageCount;
  Book(
      {this.title = "",
      this.author = "",
      this.description = "",
      this.publisher = "",
      this.publishDate = "",
      this.pageCount = 0});

  @override
  String toString() {
    // TODO: implement toString
    return "Title: $title\nAuthor: $author\nDescription: $description\nPublisher: $publisher\nPublish Date: $publishDate\nPage Count: $pageCount\n";
  }
}
