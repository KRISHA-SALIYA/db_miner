// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../provider/db_provider.dart';
//
// class FevoritPage extends StatefulWidget {
//   const FevoritPage({Key? key}) : super(key: key);
//
//   @override
//   FevoritPageState createState() => FevoritPageState();
// }
//
// class FevoritPageState extends State<FevoritPage> {
//   late Future<List<Map<String, dynamic>>> _favoriteQuotesFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _favoriteQuotesFuture = _fetchFavoriteQuotes();
//   }
//
//   Future<List<Map<String, dynamic>>> _fetchFavoriteQuotes() async {
//     try {
//       return Provider.of<DatabaseProvider>(context, listen: false)
//           .getFavoriteQuotes();
//     } catch (error) {
//       // Handle error appropriately
//       print('Error fetching favorite quotes: $error');
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorite Quotes'),
//         centerTitle: true,
//       ),
//       body: buildContent(),
//     );
//   }
//
//   Widget buildContent() {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Colors.blueGrey, Colors.black],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: FutureBuilder<List<Map<String, dynamic>>>(
//           future: _favoriteQuotesFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               final quotes = snapshot.data ?? [];
//
//               if (quotes.isEmpty) {
//                 return const Center(
//                   child: Text(
//                     'No favorite quotes available.',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 );
//               }
//
//               return ListView.builder(
//                 itemCount: quotes.length,
//                 itemBuilder: (context, index) {
//                   return _buildQuoteCard(context, quotes[index]);
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQuoteCard(BuildContext context, Map<String, dynamic> quote) {
//     return Card(
//       elevation: 4.0,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               child: Text(
//                 "${quote['id']}",
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16.0),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     quote['quotes'],
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     'Category: ${quote['category']}',
//                     style: const TextStyle(fontSize: 16.0),
//                   ),
//                   Text(
//                     'Author: ${quote['author']}',
//                     style: const TextStyle(fontSize: 16.0),
//                   ),
//                   Text(
//                     'Time: ${quote['time']}',
//                     style: const TextStyle(fontSize: 16.0),
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {
//                 _deleteQuote(context, quote['id']);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _deleteQuote(BuildContext context, int id) async {
//     final databaseProvider =
//         Provider.of<DatabaseProvider>(context, listen: false);
//     await databaseProvider.deleteQuote(id);
//     setState(() {
//       _favoriteQuotesFuture = _fetchFavoriteQuotes();
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/db_controller.dart';

class FevoritPage extends StatefulWidget {
  const FevoritPage({super.key});

  @override
  State<FevoritPage> createState() => _FevoritPageState();
}

class _FevoritPageState extends State<FevoritPage> {
  @override
  Widget build(BuildContext context) {
    DbController listnable = Provider.of<DbController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liked Quotes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: listnable.allLikeQuotesData.isNotEmpty
            ? ListView.builder(
                itemCount: listnable.allLikeQuotesData.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${listnable.allLikeQuotesData[index].image}",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${listnable.allLikeQuotesData[index].text}",
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
                      IconButton(
                        onPressed: () {
                          Provider.of<DbController>(context, listen: false)
                              .DeleteData(
                                  id: listnable.allLikeQuotesData[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: Text('No Any Liked Quotes'),
              ),
      ),
    );
  }
}
