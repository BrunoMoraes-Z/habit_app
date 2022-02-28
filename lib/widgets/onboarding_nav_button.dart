import 'package:flutter/material.dart';
import 'package:habbit_app/app_styles.dart';

class OnboardingNavButton extends StatelessWidget {
  const OnboardingNavButton({
    Key? key,
    required this.name,
    required this.onClick,
  }) : super(key: key);

  final String name;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          name,
          style: kBodyText1,
        ),
      ),
    );
  }
}
