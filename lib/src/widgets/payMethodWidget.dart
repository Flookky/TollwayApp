import 'package:flutter/material.dart';
import 'package:tollway/src/models/payment_method.dart';

class PayMethodItemWidget extends StatelessWidget {
  final PaymentMethodItem item;
  final Animation animation;
  final VoidCallback onClicked;

  const PayMethodItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          // leading: CircleAvatar(
          //   radius: 32,
          //   backgroundImage: NetworkImage(item.urlImage),
          // ),
          leading: Radio(

          ),
          title: Text(item.cardName, style: TextStyle(fontSize: 20)),
          subtitle: Text('SN:${item.cardId}', style: TextStyle(fontSize: 16)),
          trailing: IconButton(
            icon: Icon(Icons.close_outlined, color: Colors.red, size: 32),
            onPressed: onClicked,
          ),
        ),
      ),
    );
  }
}
