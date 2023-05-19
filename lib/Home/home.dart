import 'package:flutter/material.dart';
import 'package:infoware/Home/home_screen.dart';
import 'package:infoware/Screens/forms.dart';
import 'package:infoware/Screens/music_player.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _page = [const HomePage(), Forms(), const MusicPlayer()];

  int _currentSelectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _page[_currentSelectedPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 28,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentSelectedPage,
        onTap: (newIndex) {
          setState(() {
            _currentSelectedPage = newIndex;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Register'),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), label: 'Music Player')
        ],
      ),
    );
  }
}
