import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_values.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_cartdetail_listview.dart';


class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key key,  this.viewModel}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            viewModel.cart.length,
            (index) => CartDetailsViewCard(productItem: viewModel.cart[index]),
          ),
          SizedBox(height: AppValues.defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Next - \$30"),
            ),
          )
        ],
      ),
    );
  }
}
