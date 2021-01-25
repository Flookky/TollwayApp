import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/appBg.dart';

class AddPaymentCards extends StatefulWidget {
  @override
  _AddPaymentCardsState createState() => _AddPaymentCardsState();
}

class _AddPaymentCardsState extends State<AddPaymentCards> {
  bool _accept = false;

  Widget _buildAcceptCheckbox() {
    return Container(
      height: 20.0,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: _accept,
              checkColor: Colors.purple[800],
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _accept = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มบัตรเครดิต/เดบิต'),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomImage(width: 40.0, height: 40.0, margin: 5.0, image_path: 'assets/images/visa_logo.png',),
                  CustomImage(width: 40.0, height: 40.0, margin: 5.0, image_path: 'assets/images/mastercard_logo.png',),
                  CustomImage(width: 40.0, height: 40.0, margin: 5.0, image_path: 'assets/images/jcb_logo.png',),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 70.0,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    labelText: 'หมายเลขบัตรเครดิต/เดบิต',
                    // contentPadding: EdgeInsets.only(top: 14.0),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            labelText: 'วันหมดอายุ',
                            suffixIcon: IconButton(
                              //padding: EdgeInsets.only(top: 5.0),
                              onPressed: (){

                              },
                              icon: Image.asset(
                                "assets/icons/help_outline.png",
                                width: 20.0,
                                height: 20.0,
                                color: Colors.purple[700],
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              labelText: 'CCV/CVV',
                              suffixIcon: IconButton(
                                //padding: EdgeInsets.only(top: 5.0),
                                onPressed: (){
                                  ccvDialog();
                                },
                                icon: Image.asset(
                                  "assets/icons/help_outline.png",
                                  width: 20.0,
                                  height: 20.0,
                                  color: Colors.purple[700],
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 70.0,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    labelText: 'ชื่อบนบัตร(ภาษาอังกฤษ)',
                    //filled: true,
                    //fillColor: Colors.white,
                    // contentPadding: EdgeInsets.only(top: 14.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    _buildAcceptCheckbox(),
                    Container(
                      child: Flexible(
                        child: Text('ข้าพเจ้าได้อ่านเเละตกลงยอมรับเงื่อนไขการให้บริการเเละนโยบายคุ้มครองข้อมูลส่วนบุคคลของเเอปพลิเคชั่น'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    onPressed: () {},
                    child: Text(
                      "ยืนยันการเพิ่มบัตรเครดิต/เดบิต",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.purple[400],
                    textColor: Colors.white,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  void ccvDialog(){
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
}
