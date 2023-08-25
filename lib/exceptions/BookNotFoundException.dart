class BookNotFoundException implements Exception {
  String message;
  BookNotFoundException({required this.message});

  @override
  String toString() {
    return message;
  }
}
