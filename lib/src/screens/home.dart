import 'package:flutter/material.dart';
import 'package:tollway/src/screens/history.dart';
import 'package:tollway/src/screens/information.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/CustomImage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages =[
    InformationScreen(),
    PromotionsScreen(),
    HistoryScreen(),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined,),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined,),
            label: 'Account',
          ),
        ]
      ),
    );
  }
}
