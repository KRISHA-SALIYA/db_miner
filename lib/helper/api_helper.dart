import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class APiHelper {
  APiHelper._();

  static APiHelper aPiCalling = APiHelper._();

  String QuotesApi =
      "https://famous-quotes4.p.rapidapi.com/random?category=all&count=2000";

  Future<List<QuoteData>> getQuotesData() async {
    List<QuoteData> allQuotes = [];

    http.Response response = await http.get(Uri.parse(QuotesApi), headers: {
      'x-rapidapi-key': '560709b69amsh10452e5f1d2a5e5p1a1a09jsn3d6027f9e6cb',
      'x-rapidapi-host': 'famous-quotes4.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      allQuotes = data.map((e) => QuoteData.fromJson(e)).toList();
    }

    return allQuotes;
  }
}
