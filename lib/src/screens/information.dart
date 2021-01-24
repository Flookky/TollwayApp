import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tollway/src/models/data.dart';
import 'package:tollway/src/screens/history.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/user.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/appBg.dart';
import 'package:tollway/src/widgets/informationList.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  int number = 0;
  String itemName;
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.informList);

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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              AppBackground(),
              Container(
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
            ],
          ),
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         child: AnimatedList(
      //           key: key,
      //           initialItemCount: items.length,
      //           itemBuilder: (context, index, animation) =>
      //               buildItem(items[index], index, animation),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
