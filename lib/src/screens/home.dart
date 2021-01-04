import 'package:flutter/material.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages =[
    PromotionsScreen(),
    UserScreen(),
    PromotionsScreen(),
    UserScreen(),
  ];
  int _selectedIndex = 0;
  void initState(){
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void couponClick() => print("Clicked");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Tollway"),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[200],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article,),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,),
            label: 'Account',
          ),
        ]
      ),
    );
  }
}
