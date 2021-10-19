import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../presentation.dart';

class SplashViewModel extends BaseViewModel {

  init() async {
    EasyLoading.show(status: 'loading...');
    // await exampleRepository.getMoreApps();
    EasyLoading.dismiss();
    Navigator.pushNamed(context, Routers.navigation);
  }
}
