import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syboard/utils/color.dart';
import 'package:syboard/routes/home.dart';
import 'package:syboard/routes/categories.dart';
import 'package:syboard/routes/cart.dart';
import 'package:syboard/routes/favorites.dart';
import 'package:syboard/routes/profile.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var routes = [
    const Home(),
    const Categories(),
    const Cart(),
    const Favorites(),
    const Profile()
  ];
  Future<void> start() async {
    final prefs = await SharedPreferences.getInstance();

    bool initialStart = (prefs.getBool('initialStart') ?? false);
    if (!initialStart) {
      Navigator.pushNamed(context, '/walkthrough');
    }
  }

  @override
  void initState() {
    super.initState();
    start();
    // obtain shared preferences
  }

  //BottomNavigation
  static int _selectedBottomTabIndex = 0;

  void _onBottomTabPress(int index) {
    setState(() {
      _selectedBottomTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes[_selectedBottomTabIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account')
          ],
          currentIndex: _selectedBottomTabIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.black45,
          onTap: _onBottomTabPress,
          type: BottomNavigationBarType.fixed,
          elevation: 24.0,
        ),
      ),
    );
  }
}
