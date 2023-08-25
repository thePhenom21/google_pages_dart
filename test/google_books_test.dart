import 'package:flutter_test/flutter_test.dart';

import 'package:google_books/google_books.dart';

export 'package:google_books/exceptions/BookNotFoundException.dart';

void main() {
  test('isbn check', () async {
    expect(
        await GoogleBookAPI.findTitleByISBN(isbn: "1684156894")
            .then((value) => value.toString()),
        "Dune (Graphic Novel). Band 1 (limitierte Vorzugsausgabe)");
  });

  test('title-word', () async {
    await GoogleBookAPI.findTitleByWord(word: "dune").then((value) {
      for (String a in value) {
        print(a);
      }
    });
  });

  test('desc', () async {
    await GoogleBookAPI.findDescriptionByISBN(isbn: "9780441013593")
        .then((value) {
      print(value);
    });
  });

  test('author', () async {
    await GoogleBookAPI.findTitleByAuthor(author: "Frank Herbert")
        .then((value) {
      for (String a in value) {
        print(a);
      }
    });
  });

  test('book', () async {
    await GoogleBookAPI.findBookByISBN(isbn: "9780441013593").then((value) {
      print(value);
    });
  });
}
