import 'package:flutter/material.dart';
import 'package:syboard/routes/home.dart';
import 'package:syboard/routes/categories.dart';
import 'package:syboard/routes/cart.dart';
import 'package:syboard/routes/favorites.dart';
import 'package:syboard/routes/profile.dart';


class Router extends StatefulWidget {
  const Router({Key? key}) : super(key: key);

  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  var routes = [
    const Home(),
    const Categories(),
    const Cart(),
    const Favorites(),
    const Profile()
  ];

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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.red,
                size: 40,
              ))
        ],
        title: const Text(
          'GameAway',
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: routes[_selectedBottomTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Categories',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Colors.green),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.green)
        ],
        currentIndex: _selectedBottomTabIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onBottomTabPress,
      ),
    );
  }
}
