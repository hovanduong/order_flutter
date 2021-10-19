import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_values.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';
import 'package:flutter_app/src/presentation/widgets/widget_car_short.dart';
import 'package:flutter_app/src/presentation/widgets/widget_detailsview.dart';
import 'package:flutter_app/src/presentation/widgets/widget_homeheader.dart';
import 'package:flutter_app/src/presentation/widgets/widget_product_card.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        viewModel: HomeViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.init();
        },
        child: _buildBody(context),
        childMobile: _buildBodyMobile(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: _home(viewModel),
          );
        });
  }

  Widget _buildBodyMobile(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'app_name'.tr,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('app_name'.tr),
      ),
    );
  }

  Widget _home(HomeViewModel viewModel) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Color(0xFFEAEAEA),
        child: AnimatedBuilder(
            animation: viewModel,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        top: viewModel.homeState == HomeState.normal
                            ? AppValues.headerHeight
                            : -(constraints.maxHeight -
                                AppValues.cartBarHeight * 2 -
                                AppValues.headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            AppValues.headerHeight -
                            AppValues.cartBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppValues.defaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(AppValues.defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(AppValues.defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: viewModel.demoproduct.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: AppValues.defaultPadding,
                              crossAxisSpacing: AppValues.defaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product:viewModel.demoproduct[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                      opacity: animation,
                                      // child: DetailsScreen(
                                      //   product: demo_products[index],
                                      //   onProductAdd: () {
                                      //     controller.addProductToCart(
                                      //         demo_products[index]);
                                      //   },
                                      // ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: AppValues.panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: viewModel.homeState == HomeState.normal
                            ? AppValues.cartBarHeight
                            : (constraints.maxHeight - AppValues.cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: viewModel.onVerticalGesture,
                          child: Container(
                            padding: const EdgeInsets.all(AppValues.defaultPadding),
                            color: Color(0xFFEAEAEA),
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: AppValues.panelTransition,
                              child: viewModel.homeState == HomeState.normal
                                  ? CardShortView(viewModel: viewModel)
                                  : CartDetailsView(viewModel: viewModel),
                            ),
                          ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration:AppValues.panelTransition,
                        top: viewModel.homeState == HomeState.normal
                            ? 0
                            : -AppValues.headerHeight,
                        right: 0,
                        left: 0,
                        height: AppValues.headerHeight,
                        child: HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
