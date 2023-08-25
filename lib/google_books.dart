library google_books;

import 'package:dio/dio.dart';
import 'exceptions/BookNotFoundException.dart';

export 'exceptions/BookNotFoundException.dart';

class GoogleBookAPI {
  //static method to get a book's title with it's isbn (it can either be isbn10 or 13 but without the "-" sign)
  static Future<String> findTitleByISBN({required String isbn}) async {
    try {
      Response res = await Dio()
          .get("https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn");
      if (res.statusCode == 200 && res.data["totalItems"] != 0) {
        return res.data["items"][0]["volumeInfo"]["title"];
      } else {
        throw BookNotFoundException(message: "No book found with this isbn.");
      }
    } catch (err) {
      throw BookNotFoundException(
          message:
              "There is an error with either the given isbn or the Google API is currently not functioning.");
    }
  }

  //static method to find a title by a word in it
  static Future<List<String>> findTitleByWord({required String word}) async {
    try {
      Response res = await Dio()
          .get("https://www.googleapis.com/books/v1/volumes?q=intitle:$word");
      if (res.statusCode == 200 && res.data["totalItems"] != 0) {
        List<String> titles = [];

        for (dynamic element in res.data["items"]) {
          String t = element["volumeInfo"]["title"];
          titles.add(t);
        }

        return Stream.fromIterable(titles).distinct().toList();
      } else {
        throw BookNotFoundException(
            message: "No book title found with this word.");
      }
    } catch (err) {
      print(err);
      throw BookNotFoundException(
          message:
              "There is an error with either the given word or the Google API is currently not functioning.");
    }
  }

  //static method to find the description of a book by it's isbn
  static Future<String> findDescriptionByISBN({required String isbn}) async {
    try {
      Response res = await Dio()
          .get("https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn");
      if (res.statusCode == 200 && res.data["totalItems"] != 0) {
        return res.data["items"][0]["volumeInfo"]["description"];
      } else {
        throw BookNotFoundException(message: "No book found with this isbn.");
      }
    } catch (err) {
      throw BookNotFoundException(
          message:
              "There is no description for this book or the book doesn't exist in the Google's database.");
    }
  }

  //static method to find a book by it's author's name
  static Future<List<String>> findTitleByAuthor(
      {required String author}) async {
    try {
      Response res = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?q=inauthor:$author");
      if (res.statusCode == 200 && res.data["totalItems"] != 0) {
        List<String> titles = [];

        for (dynamic element in res.data["items"]) {
          String t = element["volumeInfo"]["title"];
          titles.add(t);
        }

        return Stream.fromIterable(titles).distinct().toList();
      } else {
        throw BookNotFoundException(message: "No book found with this isbn.");
      }
    } catch (err) {
      throw BookNotFoundException(
          message:
              "There is no description for this book or the book doesn't exist in the Google's database.");
    }
  }
}
