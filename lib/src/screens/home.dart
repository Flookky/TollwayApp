import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tollway/src/screens/history.dart';
import 'package:tollway/src/screens/information.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/dialogPayMethod.dart';

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

  final List<String> payMethodList = [
    "Coupon","Credit Card"
  ];

  final List<Widget> paymentList = [
    Container(
      width: double.infinity,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Text('My Coupon'),
              Text('Balance 700.00 Baht'),
            ],
          ),
        ),
      ),
    ),
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

  void changePayDialog(){
    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            child: Stack(
              alignment: Alignment.topCenter,
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: 250,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.close_rounded),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            )
                        ),
                        //SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        //payMethod()
                        //paymentList[0]
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                    child: CircleAvatar(
                      child: ClipRRect(
                        //child: CustomImage(width: 50, height: 50, margin: 0, image_path: 'assets/icons/barcode.png',),
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      radius: 45,
                      backgroundColor: Colors.purple[800],
                    )
                )
              ]
            ),
          );
        }
    );
  }

  void couponClick() => print("Clicked");

  Widget payMethod(){
    return Container(
      child: ListView.builder(
        itemCount: payMethodList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(index.toString()),
                  Text(payMethodList[index]),
                ],
              ),
            ),
          );
        },
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

  Widget routeScreen() => _pages[_selectedIndex];

  Widget bottomNav() => BottomNavigationBar(
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
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.cached_outlined,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Text(
                                  '10.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                padding: EdgeInsets.all(5),
                                child: FlatButton(
                                  child: Text(
                                    'Change',
                                    style: TextStyle(color: Colors.blueAccent, fontSize: 16,),
                                  ),
                                  onPressed: (){
                                    changePayDialog();
                                  }
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -50,
                      child: CircleAvatar(
                        child: ClipRRect(
                          //child: CustomImage(width: 50, height: 50, margin: 0, image_path: 'assets/icons/barcode.png',),
                          child: Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        radius: 45,
                        backgroundColor: Colors.purple[800],
                      )
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );


    // return Scaffold(
    //   body: _pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     backgroundColor: Colors.purple[200],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Theme.of(context).primaryColor,
    //     unselectedItemColor: Colors.grey,
    //     onTap: _onItemTapped,
    //     type: BottomNavigationBarType.shifting,
    //
    //     items: <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home_outlined,),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.shopping_basket_outlined,),
    //         label: 'Cart',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.article_outlined,),
    //         label: 'History',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.account_box_outlined,),
    //         label: 'Account',
    //       ),
    //     ]
    //   ),
    // );
  }
}
