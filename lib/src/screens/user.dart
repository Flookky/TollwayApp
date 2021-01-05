import 'package:flutter/material.dart';
import 'package:tollway/src/widgets/CustomImage.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            CustomImage(
              width: 100.0,
              height: 100.0,
              margin: 30,
              image_path: 'assets/icons/user.png',
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',

              ),
            )
          ],
        ),
      ),
    );
  }
}
