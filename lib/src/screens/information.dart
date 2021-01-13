import 'package:flutter/material.dart';
import 'package:tollway/src/models/data.dart';
import 'package:tollway/src/screens/history.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/informationList.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final List<Widget> _pages =[
    InformationScreen(),
    PromotionsScreen(),
    HistoryScreen(),
    UserScreen(),
  ];
  int _selectedIndex = 0;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  int number = 0;
  String itemName;
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.informList);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget informList(){
    return Container(
      child: Column(
        children: <Widget>[
          //dragIcon()
        ],
      ),
    );
  }

  Widget dragIcon() => Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(8),
    ),
    width: 52,
    height: 8,
  );

  Widget bottomNav(){
    return BottomNavigationBar(
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
    );
  }

  Widget buildItem(item, int index, Animation<double> animation) =>
      InformationItemWidget(
        item: item,
        animation: animation,
        onClicked: () => {

        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
