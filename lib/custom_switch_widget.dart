import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitchTalk extends StatelessWidget {
  const CustomSwitchTalk({Key? key, required this.value, required this.disabled,
    required this.onChanged, required this.primaryText, this.secondaryText, this.icon,
    this.primaryTextFontSize, this.secondaryTextFontSize, this.alignRight}) : super(key: key);
  final bool value;
  final bool disabled;
  final ValueChanged<bool> onChanged;
  final String primaryText;
  final String ? secondaryText;
  final IconData? icon;
  final double? primaryTextFontSize;
  final double? secondaryTextFontSize;
  final bool ? alignRight;
  @override
  Widget build(BuildContext context) {
    String semantics;
    if(disabled == true)
      {
        semantics = '$primaryText Switch is Disabled';
      }else if(value == true)
        {
          semantics = '$primaryText Switch is ON';
        }
    else {
      semantics = '$primaryText Switch is OFF';
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                alignRight == null || alignRight != true?
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                         WidgetSpan(
                          child: icon != null ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(icon, size: primaryTextFontSize ?? 14.0),
                          ): Container(),
                        ),
                        TextSpan(
                          text: primaryText,
                          style: TextStyle(
                              fontSize: primaryTextFontSize ?? 18.0,
                              color: disabled == true?Colors.grey:Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                ):Container(),
                Semantics(
                  label: semantics,
                  child:
                  CupertinoSwitch(value: value,
                    activeColor: disabled ? Colors.tealAccent.withOpacity(0.5): CupertinoColors.systemGreen,
                    onChanged: disabled ? null : onChanged,
                  ),
                ),
                alignRight != null && alignRight == true?
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: icon != null ? Icon(icon, size: 14): Container(),
                        ),
                        TextSpan(
                          text: primaryText,
                          style: TextStyle(
                              fontSize: primaryTextFontSize ?? 18.0,
                              color: disabled == true?Colors.grey:Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                ):Container(),
              ],
            ),
            secondaryText != null ?
            Text(
              secondaryText!,
              style: TextStyle(
                  fontSize: secondaryTextFontSize ?? 12,
                  color: Colors.grey
              ),
              textAlign: TextAlign.start,
            ):Container(),
          ],

        ),
      ),
    );
  }
}
