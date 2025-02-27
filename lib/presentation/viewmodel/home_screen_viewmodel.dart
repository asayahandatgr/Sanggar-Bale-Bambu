import 'package:flutter/material.dart';
import 'package:sanggar_budaya/domain/model/detail_budaya.dart';
import 'package:sanggar_budaya/presentation/screen/about_screen.dart';
import 'package:sanggar_budaya/presentation/screen/detail_screen.dart';

class HomeScreenViewModel extends ChangeNotifier {
  void goToDetailScreen(BuildContext context, DetailBudaya budaya) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          budaya: budaya,
        ),
      ),
    );
  }

  void goToAboutScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutScreen(),
      ),
    );
  }
}
