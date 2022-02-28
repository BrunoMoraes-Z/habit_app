import 'package:flutter/material.dart';
import 'package:habbit_app/app_styles.dart';

class LargeIconButton extends StatelessWidget {
  const LargeIconButton({
    Key? key,
    required this.text,
    required this.iconImage,
  }) : super(key: key);

  final String text, iconImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        height: 30,
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(iconImage),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: kBodyText2,
              ),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
