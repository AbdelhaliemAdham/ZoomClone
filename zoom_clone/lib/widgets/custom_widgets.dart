import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/utils/colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback function;

  CustomButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          foregroundColor: Colors.white,
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(text),
      ),
    );
  }
}
