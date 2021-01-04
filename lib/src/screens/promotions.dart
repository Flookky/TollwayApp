import 'package:flutter/material.dart';
import '../widgets/logo.dart';

class PromotionsScreen extends StatefulWidget {
  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  void couponClick() => print("Clicked");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            LogoApp(),
            Text(
              "โปรโมชั่น",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.red),
            ),
            Text(
              "(PROMOTIONS)",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.red),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,20,20,10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: couponClick,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.purple)
                  ),
                  child: Text(
                    "คูปอง ฿2000 ชำระ ฿1850",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: couponClick,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.purple)
                  ),
                  child: Text(
                    "คูปอง ฿1500 ชำระ ฿1400",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,10,20,10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: couponClick,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.purple)
                  ),
                  child: Text(
                    "คูปอง ฿500 ชำระ ฿400",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

