import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tollway/src/screens/history.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/CustomImage.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget informList(){
    return Container(
      child: Column(
        children: <Widget>[
          dragIcon()
        ],
        // children: <Widget>[
        //   ListView(
        //     children: <Widget>[
        //       ListTile(
        //         title: Text('Sun'),
        //       ),
        //       ListTile(
        //         title: Text('Moon'),
        //       ),
        //       ListTile(
        //         title: Text('Star'),
        //       ),
        //     ],
        //   )
        // ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 75, height: 150,),
                    Column(
                      children: <Widget>[
                        CustomImage(width: 50, height: 50, margin: 10, image_path: 'assets/icons/qr-code-scan.png',),
                        Text("Scan")
                      ],
                    ),
                    Spacer(flex: 2),
                    Column(
                      children: <Widget>[
                        CustomImage(width: 50, height: 50, margin: 10, image_path: 'assets/icons/barcode.png',),
                        Text("Pay")
                      ],
                    ),
                    SizedBox(width: 75, height: 150,),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(1.0, 1.5), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(12),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(1.0, 1.5), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          // Container(
                          //   padding: EdgeInsets.all(10),
                          //   child: Text(
                          //     'Tollway',
                          //     style: TextStyle(color: Colors.purple[800], fontSize: 24
                          //       , fontWeight: FontWeight.bold,),
                          //   ),
                          // ),
                          CustomImage(width: 150, height: 150, margin: 0, image_path: 'assets/images/qrcode.png',),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10, left: 20, bottom: 10, top: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Payment Type',
                                      style: TextStyle(color: Colors.black, fontSize: 18
                                        , fontWeight: FontWeight.bold,),
                                    ),
                                    Text(
                                      'Remain Income',
                                      style: TextStyle(color: Colors.grey, fontSize: 16
                                        , fontWeight: FontWeight.bold,),
                                    ),
                                  ],
                                )
                              ),
                              Spacer(flex: 2),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Change',
                                  style: TextStyle(color: Colors.blueAccent, fontSize: 16,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.only(bottom: 60.0),
                  //   child: CustomImage(width: 200, height: 200, margin: 0, image_path: 'assets/images/logo.png',),
                  // )

                ],
              )
            ],
          ),




          SlidingUpPanel(
            backdropEnabled: true,
            panelSnapping: true,
            defaultPanelState: PanelState.CLOSED,
            panel: Center(
              child: Column(
                children: <Widget>[
                  informList()
                  //bottomNav()
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
