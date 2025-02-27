import 'package:flutter/material.dart';
import 'package:sanggar_budaya/domain/model/detail_budaya.dart';

class DetailBudayaViewModel extends ChangeNotifier {
  final DetailBudaya budaya;

  DetailBudayaViewModel(this.budaya);
}
