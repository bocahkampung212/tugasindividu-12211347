import 'package:aplikasipendataanwarga/providers/berita_panel_provider.dart';
import 'package:aplikasipendataanwarga/providers/dashboard_provider.dart';
import 'package:aplikasipendataanwarga/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//run|debug
main(List<String> args) {
  runApp(MultiProvider(
    builder: (contex, widget) {
      return const MaterialApp(home: loginview());
    },
    providers: [
      ChangeNotifierProvider(create: (c) => dashboaradprovider()),
      ChangeNotifierProvider(create: (c) => BeritaPanelProvider())
    ],
  ));
}
