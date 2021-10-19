import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/resource/model/product.dart';
import 'package:flutter_app/src/resource/model/product_item.dart';

enum HomeState { normal, cart }

class HomeViewModel extends BaseViewModel {
  HomeState homeState = HomeState.normal;
  List<ProductItem> _cart = [];
  get cart => _cart;
  set cart(List<ProductItem> cart) {
    cart = _cart;
    notifyListeners();
  }

  List<Product> _demoproducts = [
    Product(title: "Cabbage", image: "assets/images/img_1.png"),
    Product(title: "Broccoli", image: "assets/images/img_2.png"),
    Product(title: "Carrot", image: "assets/images/img_3.png"),
    Product(title: "Pakcoy", image: "assets/images/img_4.png"),
    Product(title: "Cucumber", image: "assets/images/img_1.png"),
  ];
  get demoproduct => _demoproducts;
  set demoproduct(List<Product> demoproducts) {
    demoproduct = demoproducts;
    notifyListeners();
  }

  init() async {}

  changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta < -0.7) {
      changeHomeState(HomeState.cart);
    } else if (details.primaryDelta > 12) {
      changeHomeState(HomeState.normal);
    }
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
