import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';


class CardShortView extends StatelessWidget {
  const CardShortView({
    Key key,
     this.viewModel,
  }) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width:AppValues.defaultPadding),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                viewModel.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: AppValues.defaultPadding / 2),
                  child: Hero(
                    tag: viewModel.cart[index].product.title + "_cartTag",
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(viewModel.cart[index].product.image),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            viewModel.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF40A944)),
          ),
        )
      ],
    );
  }
}
