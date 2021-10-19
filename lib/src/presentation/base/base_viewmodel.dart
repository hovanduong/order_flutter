import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/resource/resource.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext _context;

  BuildContext get context => _context;

  setContext(BuildContext value) {
    _context = value;
  }

  final loadingSubject = BehaviorSubject<bool>();
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void setError(String message) {
    errorSubject.add(message);
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final AuthRepository authRepository = AuthRepository();
  final FirebaseRepository firebaseRepository = FirebaseRepository();
  final ExampleRepository exampleRepository = ExampleRepository();

  @override
  void dispose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.dispose();
  }

  void unFocus() {
    FocusScope.of(context).unfocus();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
