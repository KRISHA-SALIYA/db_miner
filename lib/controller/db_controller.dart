import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../helper/quote_data.dart';
import '../model/api_model.dart';

class DbController extends ChangeNotifier {
  List<QuoteData> allLikeQuotesData = [];

  Logger logger = Logger();

  DbController() {
    initData();
  }

  Future<void> initData() async {
    DbHelper.dbHelper.initDb();
    allLikeQuotesData = await DbHelper.dbHelper.getAllData();
    print(allLikeQuotesData[0].text);
    notifyListeners();
  }

  void insertData({required QuoteData quotes, required String image}) {
    DbHelper.dbHelper.insertData(quotes: quotes, image: image);
    logger.i(allLikeQuotesData);
    initData();
  }

  void DeleteData({required int id}) {
    DbHelper.dbHelper.deleteData(id: id);
    logger.i(allLikeQuotesData);
    initData();
  }
}
