import 'package:flutter/material.dart';
import 'package:tollway/src/models/data.dart';
import 'package:tollway/src/widgets/promoHistoryWidget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  int number = 0;
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.promoHistoryList);

  Widget buildItem(item, int index, Animation<double> animation) =>
      PromoHistoryItemWidget(
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
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0, right: 20.0),
                  child: Text(
                    'Remain Cash',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                Spacer(flex: 2,),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0, right: 20.0),
                  child: Text(
                    '350฿',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ],
            ),
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