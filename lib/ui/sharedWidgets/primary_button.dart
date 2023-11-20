import 'package:flutter/material.dart';
import 'package:flutter_assignment_filter/constants/theme.dart';

class PrimaryButton extends StatelessWidget {
  final Function? onPressed;
  final String title;
  Color buttonColor;
  Color textColor;
  var textStyle;
  double borderRadius;

  PrimaryButton(
      {Key? key,
        required this.onPressed,
        required this.title,
        this.buttonColor = CustomTheme.buttonColor,
        this.textColor = CustomTheme.backgroundWhite,
        this.borderRadius = 30.0,
        this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: onPressed != null ? MaterialStateProperty.all(buttonColor) :MaterialStateProperty.all( Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
          elevation: MaterialStateProperty.all(0)),
      onPressed: () => onPressed!(),
      child: FittedBox(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: onPressed == null
              ? CustomTheme.textStyleTitle1
              .copyWith(color: Colors.black54)
              : textStyle != null
              ? textStyle.apply(color: textColor)
              : CustomTheme.textStyleTitle1
               .apply(color: textColor),
        ),
      ),
    );
  }
}