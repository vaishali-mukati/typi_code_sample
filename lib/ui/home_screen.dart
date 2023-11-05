import 'package:flutter/material.dart';
import 'package:typi_code_sample2/ui/photos/photos_screen.dart';
import 'package:typi_code_sample2/ui/posts/posts_screen.dart';
import 'package:typi_code_sample2/ui/todos/todos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> list = [
    PostsScreen(),
    TodosScreen(),
    PhotoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
                 currentIndex: currentIndex,
                 items: const [
                   BottomNavigationBarItem(icon:Icon(Icons.home_outlined),
                   label:'Home'
                   ),
                    BottomNavigationBarItem(
                        icon:Icon(Icons.article_outlined),
                        label:'Todos',
                    ),
                    BottomNavigationBarItem(
                      icon:Icon(Icons.add_a_photo),
                      label:'Photos'
                    )
                  ],
                onTap: (index){
                   setState(() {
                     currentIndex = index;
                   });
                   },
                  ),
               body:list[currentIndex],

             );
  }
}
