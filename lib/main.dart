import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'controller/api_controller.dart';
import 'controller/db_controller.dart';
import 'helper/quote_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DbHelper.dbHelper.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuotesController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DbController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
