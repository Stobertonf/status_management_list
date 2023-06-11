import 'package:flutter/material.dart';
import 'package:status_management_list/app/pages/home_page.dart';
import 'package:status_management_list/main_app.dart';

void main() {
  runApp(const MainApp());
}

/*
Future<void> main() async {
  runApp(const MyApp());

  //Adicione a sua keyApplicationId / keyClientKey do back4App
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'mykeyApplicationId';
  const keyClientKey = 'mykeyClientKey';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
}*/
