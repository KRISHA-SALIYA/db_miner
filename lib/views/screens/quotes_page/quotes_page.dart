import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/api_controller.dart';

import '../../../model/api_model.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    QuoteData data = Provider.of<QuotesController>(context).allQuotes[index];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple.shade300,
                // image: DecorationImage(
                //   image: NetworkImage(listnable.image),
                //   fit: BoxFit.cover,
                // ),
              ),
              alignment: Alignment.center,
              child: Text(
                data.text,
                style: const TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                    )
                  ],
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          // Provider.of<DbController>(context, listen: false).insertData(
          //   quotes: data,
          //   // image: listnable.image,
          // );
        },
        icon: const Icon(Icons.thumb_up_alt),
        label: const Text('Like'),
      ),
    );
  }
}
