import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  final String image;

  const AuthLogo({super.key, required this.image});

  @override
  Container build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(3, 3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.contain,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
