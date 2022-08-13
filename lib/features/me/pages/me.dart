import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Phản hồi của người dùng'),
                  )),
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(top: 5, left: 20, bottom: 60, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Divider(
                height: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
