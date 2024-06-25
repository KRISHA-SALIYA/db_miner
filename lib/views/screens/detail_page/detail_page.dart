import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/api_controller.dart';
import '../../../controller/db_controller.dart';
import '../../../utils/app_routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isList = true;

  @override
  Widget build(BuildContext context) {
    QuotesController listnable = Provider.of<QuotesController>(context);

    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> quote =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          listnable.allQuotes.isNotEmpty
              ? ListView.builder(
                  itemCount: listnable.allQuotes.length,
                  itemBuilder: (BuildContext context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.instance.quotePage,
                          arguments: index);
                    },
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              listnable.allQuotes[index].text,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              listnable.allQuotes[index].category,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
