import 'package:flutter/material.dart';
import '../views/screens/detail_page/detail_page.dart';
import '../views/screens/fecorit_page/fevorit_page.dart';
import '../views/screens/home_page/home_page.dart';
import '../views/screens/quotes_page/quotes_page.dart';
import '../views/screens/splesh_page/splesh_page.dart';

class AppRoutes {
  String spleshPage = '/';
  String homePage = 'homePage';
  String detailPage = 'detailPage';
  String quotePage = 'quotePage';

  String fevoritPage = 'fevoritPage';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const SpleshPage(),
    'homePage': (context) => const HomePage(),
    'quotePage': (context) => const QuotePage(),
    'fevoritPage': (context) => const FevoritPage(),
    'detailPage': (context) => const DetailPage(),
  };
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  static List<Map<String, dynamic>> image = [
    {
      'image':
          'https://img.freepik.com/free-photo/abstract-design-with-colorful-patterns-nature-leaf-generated-by-ai_188544-15573.jpg',
      'name': 'Art',
    },
    {
      'image':
          'https://rukminim2.flixcart.com/image/850/1000/kxp0mfk0/poster/p/o/w/medium-art-galaxy-attitude-joker-2147-original-imaga3dm86tv9vtx.jpeg',
      'name': 'Attitude',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT79Ns0dfxwiBrLrYjoVMI0cGy0wzFSwn8IXS-QJ1cQ7DebyUM2jda4k3gzZgdUQZI7VRU&usqp=CAU',
      'name': 'Business',
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2018/01/05/07/16/balance-3062272_640.jpg',
      'name': 'Courage',
    },
    {
      'image':
          'https://i.pinimg.com/236x/68/d8/e8/68d8e8664533eceb40b2eb8cd18eb4cb.jpg',
      'name': 'Age',
    },
    {
      'image':
          'https://i.pinimg.com/236x/ac/d1/0c/acd10cb6ba5735c62eadb3531d0f5079.jpg',
      'name': 'Alone',
    },
    {
      'image':
          'https://i.pinimg.com/236x/88/de/63/88de63762a98aad08378645206ba60f1.jpg',
      'name': 'Amazing',
    },
    {
      'image':
          'https://i.pinimg.com/236x/8b/5c/62/8b5c6236ca8818e9ae541fff3298b895.jpg',
      'name': 'Anger',
    },
    {
      'image':
          'https://i.pinimg.com/236x/f9/62/0c/f9620ca77a658478c3a76b9c48614490.jpg',
      'name': 'Architecture',
    },
    {
      'image':
          'https://i.pinimg.com/236x/1f/af/fa/1faffa6eeff539a9ca13b4d9af4c4018.jpg',
      'name': 'Beauty',
    },
    {
      'image':
          'https://i.pinimg.com/236x/15/21/d4/1521d49bb2b3341d547fcb1a56a365ba.jpg',
      'name': 'Best',
    },
    {
      'image':
          'https://i.pinimg.com/236x/1f/23/ad/1f23add5462fc03924364acdab6bfa76.jpg',
      'name': 'Birthday',
    },
    {
      'image':
          'https://i.pinimg.com/236x/f6/1d/7c/f61d7c0e4ac32f7edb8fdf9afde039c9.jpg',
      'name': 'Car',
    },
    {
      'image':
          'https://i.pinimg.com/236x/e2/fa/9f/e2fa9fc90b1339e7d1006ffd1d80d941.jpg',
      'name': 'Change',
    },
    {
      'image':
          'https://i.pinimg.com/236x/12/19/4c/12194c5c011f5057b7cddcc5f82095a4.jpg',
      'name': 'Communication',
    },
    {
      'image':
          'https://i.pinimg.com/236x/88/0c/10/880c101d1079f5612402dc4ed604df90.jpg',
      'name': 'Cool',
    },
    {
      'image':
          'https://i.pinimg.com/236x/d2/1f/df/d21fdf7890a457906c8b47cc8cb8ed4f.jpg',
      'name': 'Courage',
    },
    {
      'image':
          'https://i.pinimg.com/236x/53/6c/95/536c95932dbe548719c3cc89e1a1a333.jpg',
      'name': 'Dad',
    },
    {
      'image':
          'https://i.pinimg.com/236x/e5/91/f1/e591f1a5eb8e5cb87e613f9a4b32e7fb.jpg',
      'name': 'Dating',
    },
    {
      'image':
          'https://i.pinimg.com/474x/fe/44/02/fe44029187167fbf7f01fa09d8bcbf53.jpg',
      'name': 'Death',
    },
  ];
}
