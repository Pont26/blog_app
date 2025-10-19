import 'package:flutter/material.dart';

AppBar appBarWidget(
  String title, {
  required String actionText,
  required VoidCallback onActionPressed,
}) {
  return AppBar(
    elevation: 0,
    title: Text(title),
    centerTitle: false,
     toolbarHeight: 90,
    
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: OutlinedButton(
          onPressed: onActionPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            foregroundColor: Colors.white,
          ),
          child: Text(
            actionText,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    ],

  );
}
