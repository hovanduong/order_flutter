import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_values.dart';
import 'package:flutter_app/src/presentation/widgets/widget_price.dart';
import 'package:flutter_app/src/resource/model/product_item.dart';


class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard({
    Key key,
     this.productItem,
  }) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical:AppValues.defaultPadding / 2),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product.image),
      ),
      title: Text(
        productItem.product.title,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: "20"),
            Text(
              "  x ${productItem.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
