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
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(1.0, 1.5), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Container(

                      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
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
                          CustomImage(width: 150, height: 150, margin: 0, image_path: 'assets/images/qrcode.png',),

                        ],
                      ),
                      //margin: EdgeInsets.all(20),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 60.0),
                    child: CustomImage(width: 200, height: 200, margin: 0, image_path: 'assets/images/logo.png',),
                  )
                  // Container(
                  //   margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  //   child: CustomImage(width: 200, height: 200, margin: 0, image_path: 'assets/images/logo.png',),
                  // )

                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(40.0),
                  // )


                ],
              )
              //CustomImage(width: 150, height: 150, margin: 10, image_path: 'assets/images/logo.png',),


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
