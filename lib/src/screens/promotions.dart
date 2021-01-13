import 'package:flutter/material.dart';
import '../widgets/CustomImage.dart';

class PromotionsScreen extends StatefulWidget {
  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  void couponClick() => print("Clicked");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: <Widget>[
              CustomImage(width: 230.0, height: 230.0, margin: 0.0, image_path: 'assets/images/logo.png',),
              Text(
                "โปรโมชั่น",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "(PROMOTIONS)",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20,30,20,10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    onPressed: couponClick,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.purple, width: 2)
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
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    onPressed: couponClick,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.purple, width: 2)
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
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    onPressed: couponClick,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.purple, width: 2)
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
      ),
    );
  }
}

