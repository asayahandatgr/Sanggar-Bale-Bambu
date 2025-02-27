import 'package:flutter/material.dart';
import 'package:sanggar_budaya/presentation/widgets/adat_grid.dart';
import 'package:sanggar_budaya/presentation/widgets/sanggar_bottom_navigation.dart';

class FavoriteScreen extends StatelessWidget {
  final List<String> favorite;

  const FavoriteScreen({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Produk yang disukai',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                AdatGrid(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const SanggarBottomNavigation(initialIndex: 1),
    );
  }
}
