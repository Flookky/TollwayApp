import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tollway/src/widgets/CustomImage.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

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

                    SizedBox(width: 75, height: 180,),
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
                    SizedBox(width: 75, height: 180,),
                  ],
                ),
              ),
              Text("This is the Widget behind the sliding panel"),
              Text("This is the Widget behind the sliding panel"),
              Text("This is the Widget behind the sliding panel"),
              Text("This is the Widget behind the sliding panel"),
              Text("This is the Widget behind the sliding panel"),
              Text("This is the Widget behind the sliding panel"),

            ],
          ),

          SlidingUpPanel(
            panel: Center(child: Text("This is the sliding Widget"),),
          )
        ],
      ),
    );
  }
}
