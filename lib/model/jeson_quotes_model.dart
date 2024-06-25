class QuoteData {
  final String quote;
  final String author;
  final String category;
  bool isLike = false;

  // Parameterized Constructor

  QuoteData({
    required this.author,
    required this.category,
    required this.quote,
  });

// Fectory cunstructor

  factory QuoteData.fromMape({required Map<String, dynamic> data}) => QuoteData(
        quote: data['quote'],
        author: data['author'],
        category: data['category'],
      );
}
