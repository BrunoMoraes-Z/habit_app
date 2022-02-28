import 'package:flutter/material.dart';
import 'package:habbit_app/app_styles.dart';
import 'package:habbit_app/size_config.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.onClick,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeV! * 100,
        child: TextButton(
          onPressed: onClick,
          child: Text(
            text,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
