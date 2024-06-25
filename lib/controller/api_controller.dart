import 'package:flutter/material.dart';

import '../helper/api_helper.dart';
import '../model/api_model.dart';

class QuotesController extends ChangeNotifier {
  List<QuoteData> allQuotes = [];

  QuotesController() {
    loadData();
  }

  Future<void> loadData() async {
    allQuotes = await APiHelper.aPiCalling.getQuotesData();
    notifyListeners();
  }
}
