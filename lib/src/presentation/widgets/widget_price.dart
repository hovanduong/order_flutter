import 'package:flutter/material.dart';


class Price extends StatelessWidget {
  const Price({
    Key key,
     this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.w600, color: Color(0xFF40A944)),
        children: [
          TextSpan(
            text: amount,
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "/kg",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
